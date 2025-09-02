import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:ble_client_demo/constants/ble_uuids.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleService {
  BluetoothDevice? connectedDevice;
  BluetoothService? deviceInfoService;
  BluetoothService? sensorDataService;
  BluetoothService? controlService;

  final StreamController<String> _deviceNameController =
      StreamController<String>.broadcast();
  final StreamController<String> _firmwareVersionController =
      StreamController<String>.broadcast();
  final StreamController<double> _temperatureController =
      StreamController<double>.broadcast();
  final StreamController<int> _humidityController =
      StreamController<int>.broadcast();
  final StreamController<int> _batteryLevelController =
      StreamController<int>.broadcast();
  final StreamController<String> _statusController =
      StreamController<String>.broadcast();

  Stream<String> get deviceNameStream => _deviceNameController.stream;

  Stream<String> get firmwareVersionStream => _firmwareVersionController.stream;

  Stream<double> get temperatureStream => _temperatureController.stream;

  Stream<int> get humidityStream => _humidityController.stream;

  Stream<int> get batteryLevelStream => _batteryLevelController.stream;

  Stream<String> get statusStream => _statusController.stream;

  Future<void> startScan() async {
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 15));
  }

  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
  }

  Stream<List<ScanResult>> get scanResults => FlutterBluePlus.scanResults;

  Future<bool> connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect(timeout: const Duration(seconds: 15));
      connectedDevice = device;
      await _discoverServices();
      await _setupNotifications();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> disconnect() async {
    if (connectedDevice != null) {
      await connectedDevice!.disconnect();
      connectedDevice = null;
    }
  }

  Future<void> _discoverServices() async {
    if (connectedDevice == null) return;

    final services = await connectedDevice!.discoverServices();

    for (final service in services) {
      switch (service.uuid.toString().toLowerCase()) {
        case BleUuids.deviceInfoService:
          deviceInfoService = service;
          break;
        case BleUuids.sensorDataService:
          sensorDataService = service;
          break;
        case BleUuids.controlService:
          controlService = service;
          break;
      }
    }
  }

  Future<void> _setupNotifications() async {
    if (sensorDataService != null) {
      for (final characteristic in sensorDataService!.characteristics) {
        if (characteristic.properties.notify) {
          await characteristic.setNotifyValue(true);
          characteristic.onValueReceived.listen((value) {
            _handleNotification(characteristic.uuid.toString(), value);
          });
        }
      }
    }

    if (controlService != null) {
      for (final characteristic in controlService!.characteristics) {
        if (characteristic.properties.notify) {
          await characteristic.setNotifyValue(true);
          characteristic.onValueReceived.listen((value) {
            _handleNotification(characteristic.uuid.toString(), value);
          });
        }
      }
    }
  }

  void _handleNotification(String uuid, List<int> value) {
    switch (uuid.toLowerCase()) {
      case BleUuids.temperatureCharacteristic:
        final temperature = _parseTemperature(value);
        _temperatureController.add(temperature);
        break;
      case BleUuids.batteryLevelCharacteristic:
        final batteryLevel = _parseBatteryLevel(value);
        _batteryLevelController.add(batteryLevel);
        break;
      case BleUuids.statusCharacteristic:
        final status = _parseStatus(value);
        _statusController.add(status);
        break;
    }
  }

  int _parseBatteryLevel(List<int> value) {
    if (value.isEmpty) {
      return 0;
    }
    return value[0];
  }

  String _parseStatus(List<int> value) {
    if (value.isEmpty) {
      return '';
    }
    return utf8.decode(value);
  }

  double _parseTemperature(List<int> value) {
    if (value.length < 2) {
      return 0.0;
    }

    var bleData = Uint8List.fromList(value);
    var byteData = ByteData.view(bleData.buffer);

    int integerPart = byteData.getInt8(0);
    int fractionalPart = byteData.getUint8(1);

    double temperature = integerPart + (fractionalPart / 100.0);

    return temperature;
  }

  int _parseHumidity(List<int> value) {
    if (value.isEmpty) {
      return 0;
    }

    var bleData = Uint8List.fromList(value);
    var byteData = ByteData.view(bleData.buffer);
    int humidity = byteData.getInt8(0);

    return humidity;
  }

  Future<String?> readDeviceName() async {
    final characteristic = _findCharacteristic(
      deviceInfoService,
      BleUuids.deviceNameCharacteristic,
    );
    if (characteristic != null) {
      final value = await characteristic.read();
      debugPrint('readDeviceName value: $value');

      final deviceName = utf8.decode(value);

      debugPrint('readDeviceName deviceName: $deviceName');

      _deviceNameController.add(deviceName);
      return deviceName;
    }
    return null;
  }

  Future<String?> readFirmwareVersion() async {
    final characteristic = _findCharacteristic(
      deviceInfoService,
      BleUuids.firmwareVersionCharacteristic,
    );
    if (characteristic != null) {
      final value = await characteristic.read();

      debugPrint('readFirmwareVersion value: $value');

      final version = utf8.decode(value);

      debugPrint('readFirmwareVersion version: $version');

      _firmwareVersionController.add(version);
      return version;
    }
    return null;
  }

  Future<double?> readTemperature() async {
    final characteristic = _findCharacteristic(
      sensorDataService,
      BleUuids.temperatureCharacteristic,
    );
    if (characteristic != null) {
      final value = await characteristic.read();

      debugPrint('readTemperature: value: $value');
      final temperature = _parseTemperature(value);
      debugPrint('readTemperature temperature: $temperature');

      _temperatureController.add(temperature);
      return temperature;
    }
    return null;
  }

  Future<int?> readHumidity() async {
    final characteristic = _findCharacteristic(
      sensorDataService,
      BleUuids.humidityCharacteristic,
    );
    if (characteristic != null) {
      final value = await characteristic.read();
      debugPrint('readHumidity value: $value');
      final humidity = _parseHumidity(value);
      debugPrint('readHumidity humidity: $humidity');

      _humidityController.add(humidity);
      return humidity;
    }
    return null;
  }

  Future<int?> readBatteryLevel() async {
    final characteristic = _findCharacteristic(
      sensorDataService,
      BleUuids.batteryLevelCharacteristic,
    );
    if (characteristic != null) {
      final value = await characteristic.read();
      debugPrint('readBatteryLevel value: $value');
      final batteryLevel = _parseBatteryLevel(value);
      debugPrint('readBatteryLevel batteryLevel: $batteryLevel');

      _batteryLevelController.add(batteryLevel);
      return batteryLevel;
    }
    return null;
  }

  Future<String?> readStatus() async {
    final characteristic = _findCharacteristic(
      controlService,
      BleUuids.statusCharacteristic,
    );
    if (characteristic != null) {
      final value = await characteristic.read();
      debugPrint('readStatus value: $value');

      final status = _parseStatus(value);

      debugPrint('readStatus status: $status');

      _statusController.add(status);
      return status;
    }
    return null;
  }

  Future<bool> writeLedControl(int value) async {
    final characteristic = _findCharacteristic(
      controlService,
      BleUuids.ledControlCharacteristic,
    );
    if (characteristic != null) {
      try {
        debugPrint('writeLedControl value: $value');
        await characteristic.write([value], withoutResponse: true);
        return true;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  Future<bool> writeCommand(String command) async {
    final characteristic = _findCharacteristic(
      controlService,
      BleUuids.commandCharacteristic,
    );
    if (characteristic != null) {
      try {
        debugPrint('writeCommand command: $command');
        await characteristic.write(utf8.encode(command));
        return true;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  Future<bool> writeStatus(String status) async {
    final characteristic = _findCharacteristic(
      controlService,
      BleUuids.statusCharacteristic,
    );
    if (characteristic != null) {
      try {
        debugPrint('writeStatus status: $status');
        await characteristic.write(utf8.encode(status));
        return true;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  BluetoothCharacteristic? _findCharacteristic(
    BluetoothService? service,
    String uuid,
  ) {
    if (service == null) return null;

    for (final characteristic in service.characteristics) {
      if (characteristic.uuid.toString().toLowerCase() == uuid) {
        return characteristic;
      }
    }
    return null;
  }

  bool get isConnected => connectedDevice?.isConnected ?? false;

  void dispose() {
    _deviceNameController.close();
    _firmwareVersionController.close();
    _temperatureController.close();
    _humidityController.close();
    _batteryLevelController.close();
    _statusController.close();
  }
}
