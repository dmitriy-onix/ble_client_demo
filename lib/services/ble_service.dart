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
  StreamSubscription? _bondStateSubscription;

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
  final StreamController<bool> _bondedController =
      StreamController<bool>.broadcast();

  bool _currentBondedState = false;

  Stream<String> get deviceNameStream => _deviceNameController.stream;

  Stream<String> get firmwareVersionStream => _firmwareVersionController.stream;

  Stream<double> get temperatureStream => _temperatureController.stream;

  Stream<int> get humidityStream => _humidityController.stream;

  Stream<int> get batteryLevelStream => _batteryLevelController.stream;

  Stream<String> get statusStream => _statusController.stream;

  Stream<bool> get bondedStream => _bondedController.stream;

  bool get currentBondedState => _currentBondedState;

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
      _setupBondStateMonitoring();
      return true;
    } catch (e) {
      debugPrint('connectToDevice error: $e');
      connectedDevice = null;
      return false;
    }
  }

  Future<void> disconnect() async {
    if (connectedDevice != null) {
      await connectedDevice!.disconnect();
      connectedDevice = null;
    }
    _currentBondedState = false;
    _bondStateSubscription?.cancel();
    _bondStateSubscription = null;
  }

  Future<void> _discoverServices() async {
    final device = connectedDevice;
    if (device == null) return;

    final services = await device.discoverServices();

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
    final sensor = sensorDataService;
    final control = controlService;

    if (sensor != null) {
      for (final characteristic in sensor.characteristics) {
        if (characteristic.properties.notify) {
          await characteristic.setNotifyValue(true);
          characteristic.onValueReceived.listen((value) {
            _handleNotification(characteristic.uuid.toString(), value);
          });
        }
      }
    }

    if (control != null) {
      for (final characteristic in control.characteristics) {
        if (characteristic.properties.notify) {
          await characteristic.setNotifyValue(true);
          characteristic.onValueReceived.listen((value) {
            _handleNotification(characteristic.uuid.toString(), value);
          });
        }
      }
    }
  }

  void _setupBondStateMonitoring() {
    final device = connectedDevice;
    if (device == null) return;

    _bondStateSubscription?.cancel();

    _bondStateSubscription = device.bondState.listen((bondState) {
      debugPrint('Bond state changed to: $bondState');
      final isBonded = bondState == BluetoothBondState.bonded;
      _currentBondedState = isBonded;
      _bondedController.add(isBonded);
    });

    _checkInitialBondState();
  }

  Future<void> _checkInitialBondState() async {
    final device = connectedDevice;
    if (device == null) return;

    try {
      debugPrint('Checking initial bond state from stream...');
      final bondStateTimeout = device.bondState.timeout(
        const Duration(seconds: 2),
        onTimeout: (sink) {
          debugPrint('Bond state stream timeout - assuming not bonded');
          sink.add(BluetoothBondState.none);
        },
      );

      await for (final bondState in bondStateTimeout.take(1)) {
        final isBonded = bondState == BluetoothBondState.bonded;
        debugPrint('Bond state from stream: $bondState (bonded: $isBonded)');
        _currentBondedState = isBonded;
        _bondedController.add(isBonded);
        break;
      }
    } catch (error) {
      debugPrint(
        'Error checking initial bond state: $error - assuming not bonded',
      );
      _currentBondedState = false;
      _bondedController.add(false);
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

    if (characteristic == null) {
      return null;
    }

    try {
      final value = await characteristic.read();
      debugPrint('readDeviceName value: $value');

      final deviceName = utf8.decode(value);

      debugPrint('readDeviceName deviceName: $deviceName');

      _deviceNameController.add(deviceName);
      return deviceName;
    } catch (e) {
      return null;
    }
  }

  Future<String?> readFirmwareVersion() async {
    final characteristic = _findCharacteristic(
      deviceInfoService,
      BleUuids.firmwareVersionCharacteristic,
    );

    if (characteristic == null) {
      return null;
    }

    try {
      final value = await characteristic.read();
      debugPrint('readFirmwareVersion value: $value');

      final version = utf8.decode(value);
      debugPrint('readFirmwareVersion version: $version');

      _firmwareVersionController.add(version);
      return version;
    } catch (e) {
      return null;
    }
  }

  Future<double?> readTemperature() async {
    final characteristic = _findCharacteristic(
      sensorDataService,
      BleUuids.temperatureCharacteristic,
    );

    if (characteristic == null) {
      return null;
    }

    try {
      final value = await characteristic.read();
      debugPrint('readTemperature value: $value');

      final temperature = _parseTemperature(value);
      debugPrint('readTemperature temperature: $temperature');

      _temperatureController.add(temperature);
      return temperature;
    } catch (e) {
      return null;
    }
  }

  Future<int?> readHumidity() async {
    final characteristic = _findCharacteristic(
      sensorDataService,
      BleUuids.humidityCharacteristic,
    );

    if (characteristic == null) {
      return null;
    }

    try {
      final value = await characteristic.read();
      debugPrint('readHumidity value: $value');

      final humidity = _parseHumidity(value);
      debugPrint('readHumidity humidity: $humidity');

      _humidityController.add(humidity);
      return humidity;
    } catch (e) {
      return null;
    }
  }

  Future<int?> readBatteryLevel() async {
    final characteristic = _findCharacteristic(
      sensorDataService,
      BleUuids.batteryLevelCharacteristic,
    );

    if (characteristic == null) {
      return null;
    }

    try {
      final value = await characteristic.read();
      debugPrint('readBatteryLevel value: $value');

      final batteryLevel = _parseBatteryLevel(value);
      debugPrint('readBatteryLevel batteryLevel: $batteryLevel');

      _batteryLevelController.add(batteryLevel);
      return batteryLevel;
    } catch (e) {
      return null;
    }
  }

  Future<String?> readStatus() async {
    final characteristic = _findCharacteristic(
      controlService,
      BleUuids.statusCharacteristic,
    );

    if (characteristic == null) {
      return null;
    }

    try {
      final value = await characteristic.read();
      debugPrint('readStatus value: $value');

      final status = _parseStatus(value);
      debugPrint('readStatus status: $status');

      _statusController.add(status);
      return status;
    } catch (e) {
      debugPrint('readStatus error: $e - Control Service requires bonding');
      return null;
    }
  }

  Future<bool> writeLedControl(int value) async {
    final characteristic = _findCharacteristic(
      controlService,
      BleUuids.ledControlCharacteristic,
    );

    if (characteristic == null) {
      return false;
    }

    try {
      debugPrint('writeLedControl value: $value');
      await characteristic.write([value], withoutResponse: true);
      return true;
    } catch (e) {
      debugPrint(
        'writeLedControl error: $e - Control Service requires bonding',
      );
      return false;
    }
  }

  Future<bool> writeCommand(String command) async {
    final characteristic = _findCharacteristic(
      controlService,
      BleUuids.commandCharacteristic,
    );

    if (characteristic == null) {
      return false;
    }

    try {
      debugPrint('writeCommand command: $command');
      await characteristic.write(utf8.encode(command));
      return true;
    } catch (e) {
      debugPrint('writeCommand error: $e - Control Service requires bonding');
      return false;
    }
  }

  Future<bool> writeStatus(String status) async {
    final characteristic = _findCharacteristic(
      controlService,
      BleUuids.statusCharacteristic,
    );

    if (characteristic == null) {
      return false;
    }

    try {
      debugPrint('writeStatus status: $status');
      await characteristic.write(utf8.encode(status));
      return true;
    } catch (e) {
      debugPrint('writeStatus error: $e - Control Service requires bonding');
      return false;
    }
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

  bool get isBonded {
    final device = connectedDevice;
    if (device == null) return false;
    // For flutter_blue_plus, bondState is a Stream, so we can't check synchronously
    // This will be updated via stream listener
    return false; // Default to false, will be updated by stream
  }

  Future<bool> createBond() async {
    final device = connectedDevice;
    if (device == null) return false;

    try {
      debugPrint(
        'createBond: Attempting to bond with device ${device.platformName}',
      );
      await device.createBond();

      // Listen to bond state changes to determine success
      final bondStateCompleter = Completer<bool>();
      late StreamSubscription subscription;

      subscription = device.bondState.listen((bondState) {
        debugPrint('createBond: Bond state changed to $bondState');
        if (bondState == BluetoothBondState.bonded) {
          _currentBondedState = true;
          _bondedController.add(true);
          if (!bondStateCompleter.isCompleted) {
            bondStateCompleter.complete(true);
          }
        } else if (bondState == BluetoothBondState.none) {
          _currentBondedState = false;
          _bondedController.add(false);
          if (!bondStateCompleter.isCompleted) {
            bondStateCompleter.complete(false);
          }
        }
      });

      // Wait for bonding result with timeout
      final result = await bondStateCompleter.future.timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          _currentBondedState = false;
          _bondedController.add(false);
          return false;
        },
      );

      subscription.cancel();
      return result;
    } catch (e) {
      debugPrint('createBond error: $e');
      _currentBondedState = false;
      _bondedController.add(false);
      return false;
    }
  }

  Future<bool> removeBond() async {
    final device = connectedDevice;
    if (device == null) return false;

    try {
      debugPrint(
        'removeBond: Removing bond with device ${device.platformName}',
      );
      await device.removeBond();

      // Listen to bond state changes to determine success
      final bondStateCompleter = Completer<bool>();
      late StreamSubscription subscription;

      subscription = device.bondState.listen((bondState) {
        debugPrint('removeBond: Bond state changed to $bondState');
        if (bondState == BluetoothBondState.none) {
          _currentBondedState = false;
          _bondedController.add(false);
          if (!bondStateCompleter.isCompleted) {
            bondStateCompleter.complete(true); // Success means bond was removed
          }
        }
      });

      // Wait for bond removal result with timeout
      final result = await bondStateCompleter.future.timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          // Assume success if no response
          _currentBondedState = false;
          _bondedController.add(false);
          return true;
        },
      );

      subscription.cancel();
      return result;
    } catch (e) {
      debugPrint('removeBond error: $e');
      _currentBondedState = false;
      _bondedController.add(false);
      return false;
    }
  }

  void dispose() {
    _bondStateSubscription?.cancel();
    _deviceNameController.close();
    _firmwareVersionController.close();
    _temperatureController.close();
    _humidityController.close();
    _batteryLevelController.close();
    _statusController.close();
    _bondedController.close();
  }
}
