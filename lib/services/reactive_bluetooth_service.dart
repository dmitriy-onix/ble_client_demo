import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:ble_client_demo/constants/ble_uuids.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

/// A BLE service implementation using the flutter_reactive_ble package.
/// This is a comparative implementation to BleService (flutter_blue_plus).
class ReactiveBluetoothService {
  final _flutterReactiveBle = FlutterReactiveBle();

  String? connectedDeviceId;
  StreamSubscription<ConnectionStateUpdate>? _connectionSubscription;
  StreamSubscription<DiscoveredDevice>? _scanSubscription;
  StreamSubscription<List<int>>? _characteristicSubscription;

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
  final StreamController<DiscoveredDevice> _scanResultsController =
      StreamController<DiscoveredDevice>.broadcast();

  bool _isConnected = false;

  Stream<String> get deviceNameStream => _deviceNameController.stream;

  Stream<String> get firmwareVersionStream => _firmwareVersionController.stream;

  Stream<double> get temperatureStream => _temperatureController.stream;

  Stream<int> get humidityStream => _humidityController.stream;

  Stream<int> get batteryLevelStream => _batteryLevelController.stream;

  Stream<String> get statusStream => _statusController.stream;

  Stream<DiscoveredDevice> get scanResults => _scanResultsController.stream;

  bool get isConnected => _isConnected;

  Future<void> startScan() async {
    try {
      debugPrint('ReactiveBluetoothService: Starting BLE scan');

      await stopScan(); // Stop any existing scan

      _scanSubscription = _flutterReactiveBle
          .scanForDevices(
            withServices: [], // Scan for all devices
            scanMode: ScanMode.lowLatency,
          )
          .listen(
            (device) {
              debugPrint(
                'ReactiveBluetoothService: Found device: ${device.name} (${device.id})',
              );
              _scanResultsController.add(device);
            },
            onError: (error) {
              debugPrint('ReactiveBluetoothService: Scan error: $error');
            },
          );
    } catch (e) {
      debugPrint('ReactiveBluetoothService startScan error: $e');
    }
  }

  Future<void> stopScan() async {
    try {
      debugPrint('ReactiveBluetoothService: Stopping BLE scan');
      await _scanSubscription?.cancel();
      _scanSubscription = null;
    } catch (e) {
      debugPrint('ReactiveBluetoothService stopScan error: $e');
    }
  }

  Future<bool> connectToDevice(String deviceId) async {
    try {
      debugPrint(
        'ReactiveBluetoothService: Attempting to connect to $deviceId',
      );

      // Cancel any existing connection
      await disconnect();

      final connectionCompleter = Completer<bool>();

      _connectionSubscription = _flutterReactiveBle
          .connectToDevice(
            id: deviceId,
            connectionTimeout: const Duration(seconds: 15),
          )
          .listen(
            (connectionState) {
              debugPrint(
                'ReactiveBluetoothService: Connection state: ${connectionState.connectionState}',
              );

              switch (connectionState.connectionState) {
                case DeviceConnectionState.connected:
                  connectedDeviceId = deviceId;
                  _isConnected = true;
                  if (!connectionCompleter.isCompleted) {
                    connectionCompleter.complete(true);
                  }
                  _setupNotifications();
                  break;
                case DeviceConnectionState.disconnected:
                  connectedDeviceId = null;
                  _isConnected = false;
                  if (!connectionCompleter.isCompleted) {
                    connectionCompleter.complete(false);
                  }
                  break;
                case DeviceConnectionState.connecting:
                  debugPrint('ReactiveBluetoothService: Connecting...');
                  break;
                case DeviceConnectionState.disconnecting:
                  debugPrint('ReactiveBluetoothService: Disconnecting...');
                  break;
              }
            },
            onError: (error) {
              debugPrint('ReactiveBluetoothService: Connection error: $error');
              if (!connectionCompleter.isCompleted) {
                connectionCompleter.complete(false);
              }
            },
          );

      return await connectionCompleter.future;
    } catch (e) {
      debugPrint('ReactiveBluetoothService connectToDevice error: $e');
      connectedDeviceId = null;
      _isConnected = false;
      return false;
    }
  }

  Future<void> disconnect() async {
    try {
      if (_connectionSubscription != null) {
        debugPrint(
          'ReactiveBluetoothService: Disconnecting from $connectedDeviceId',
        );
        await _connectionSubscription?.cancel();
        _connectionSubscription = null;
      }

      await _characteristicSubscription?.cancel();
      _characteristicSubscription = null;

      connectedDeviceId = null;
      _isConnected = false;
    } catch (e) {
      debugPrint('ReactiveBluetoothService disconnect error: $e');
    }
  }

  Future<void> _setupNotifications() async {
    if (connectedDeviceId == null) return;

    try {
      debugPrint('ReactiveBluetoothService: Setting up notifications');

      // Set up notifications for temperature characteristic
      final tempCharacteristic = QualifiedCharacteristic(
        serviceId: Uuid.parse(BleUuids.sensorDataService),
        characteristicId: Uuid.parse(BleUuids.temperatureCharacteristic),
        deviceId: connectedDeviceId!,
      );

      // Note: Additional characteristics for battery and status would be defined here
      // final batteryCharacteristic = QualifiedCharacteristic(...);
      // final statusCharacteristic = QualifiedCharacteristic(...);

      // Subscribe to temperature notifications
      _characteristicSubscription = _flutterReactiveBle
          .subscribeToCharacteristic(tempCharacteristic)
          .listen((data) {
            _handleNotification(
              BleUuids.temperatureCharacteristic,
              Uint8List.fromList(data),
            );
          });

      // Note: flutter_reactive_ble allows only one subscription at a time per connection
      // In a real implementation, you would need to manage multiple subscriptions
      // or use a different approach to handle multiple characteristics
    } catch (e) {
      debugPrint('ReactiveBluetoothService _setupNotifications error: $e');
    }
  }

  void _handleNotification(String uuid, Uint8List value) {
    debugPrint(
      'ReactiveBluetoothService: Received notification for $uuid with value: $value',
    );
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

  // Data parsing methods (same as BleService)
  int _parseBatteryLevel(Uint8List value) {
    if (value.isEmpty) {
      return 0;
    }
    return value[0];
  }

  String _parseStatus(Uint8List value) {
    if (value.isEmpty) {
      return '';
    }
    return utf8.decode(value);
  }

  double _parseTemperature(Uint8List value) {
    if (value.length < 2) {
      return 0.0;
    }

    var byteData = ByteData.view(value.buffer);
    int integerPart = byteData.getInt8(0);
    int fractionalPart = byteData.getUint8(1);
    double temperature = integerPart + (fractionalPart / 100.0);

    return temperature;
  }

  int _parseHumidity(Uint8List value) {
    if (value.isEmpty) {
      return 0;
    }

    var byteData = ByteData.view(value.buffer);
    int humidity = byteData.getInt8(0);

    return humidity;
  }

  Future<String?> readDeviceName() async {
    if (connectedDeviceId == null) return null;

    try {
      final characteristic = QualifiedCharacteristic(
        serviceId: Uuid.parse(BleUuids.deviceInfoService),
        characteristicId: Uuid.parse(BleUuids.deviceNameCharacteristic),
        deviceId: connectedDeviceId!,
      );

      final value = await _flutterReactiveBle.readCharacteristic(
        characteristic,
      );
      debugPrint('ReactiveBluetoothService readDeviceName value: $value');

      final deviceName = utf8.decode(value);
      debugPrint(
        'ReactiveBluetoothService readDeviceName deviceName: $deviceName',
      );

      _deviceNameController.add(deviceName);
      return deviceName;
    } catch (e) {
      debugPrint('ReactiveBluetoothService readDeviceName error: $e');
      return null;
    }
  }

  Future<String?> readFirmwareVersion() async {
    if (connectedDeviceId == null) return null;

    try {
      final characteristic = QualifiedCharacteristic(
        serviceId: Uuid.parse(BleUuids.deviceInfoService),
        characteristicId: Uuid.parse(BleUuids.firmwareVersionCharacteristic),
        deviceId: connectedDeviceId!,
      );

      final value = await _flutterReactiveBle.readCharacteristic(
        characteristic,
      );
      debugPrint('ReactiveBluetoothService readFirmwareVersion value: $value');

      final version = utf8.decode(value);
      debugPrint(
        'ReactiveBluetoothService readFirmwareVersion version: $version',
      );

      _firmwareVersionController.add(version);
      return version;
    } catch (e) {
      debugPrint('ReactiveBluetoothService readFirmwareVersion error: $e');
      return null;
    }
  }

  Future<double?> readTemperature() async {
    if (connectedDeviceId == null) return null;

    try {
      final characteristic = QualifiedCharacteristic(
        serviceId: Uuid.parse(BleUuids.sensorDataService),
        characteristicId: Uuid.parse(BleUuids.temperatureCharacteristic),
        deviceId: connectedDeviceId!,
      );

      final value = await _flutterReactiveBle.readCharacteristic(
        characteristic,
      );
      debugPrint('ReactiveBluetoothService readTemperature value: $value');

      final temperature = _parseTemperature(Uint8List.fromList(value));
      debugPrint(
        'ReactiveBluetoothService readTemperature temperature: $temperature',
      );

      _temperatureController.add(temperature);
      return temperature;
    } catch (e) {
      debugPrint('ReactiveBluetoothService readTemperature error: $e');
      return null;
    }
  }

  Future<int?> readHumidity() async {
    if (connectedDeviceId == null) return null;

    try {
      final characteristic = QualifiedCharacteristic(
        serviceId: Uuid.parse(BleUuids.sensorDataService),
        characteristicId: Uuid.parse(BleUuids.humidityCharacteristic),
        deviceId: connectedDeviceId!,
      );

      final value = await _flutterReactiveBle.readCharacteristic(
        characteristic,
      );
      debugPrint('ReactiveBluetoothService readHumidity value: $value');

      final humidity = _parseHumidity(Uint8List.fromList(value));
      debugPrint('ReactiveBluetoothService readHumidity humidity: $humidity');

      _humidityController.add(humidity);
      return humidity;
    } catch (e) {
      debugPrint('ReactiveBluetoothService readHumidity error: $e');
      return null;
    }
  }

  Future<int?> readBatteryLevel() async {
    if (connectedDeviceId == null) return null;

    try {
      final characteristic = QualifiedCharacteristic(
        serviceId: Uuid.parse(BleUuids.sensorDataService),
        characteristicId: Uuid.parse(BleUuids.batteryLevelCharacteristic),
        deviceId: connectedDeviceId!,
      );

      final value = await _flutterReactiveBle.readCharacteristic(
        characteristic,
      );
      debugPrint('ReactiveBluetoothService readBatteryLevel value: $value');

      final batteryLevel = _parseBatteryLevel(Uint8List.fromList(value));
      debugPrint(
        'ReactiveBluetoothService readBatteryLevel batteryLevel: $batteryLevel',
      );

      _batteryLevelController.add(batteryLevel);
      return batteryLevel;
    } catch (e) {
      debugPrint('ReactiveBluetoothService readBatteryLevel error: $e');
      return null;
    }
  }

  Future<String?> readStatus() async {
    if (connectedDeviceId == null) return null;

    try {
      final characteristic = QualifiedCharacteristic(
        serviceId: Uuid.parse(BleUuids.controlService),
        characteristicId: Uuid.parse(BleUuids.statusCharacteristic),
        deviceId: connectedDeviceId!,
      );

      final value = await _flutterReactiveBle.readCharacteristic(
        characteristic,
      );
      debugPrint('ReactiveBluetoothService readStatus value: $value');

      final status = _parseStatus(Uint8List.fromList(value));
      debugPrint('ReactiveBluetoothService readStatus status: $status');

      _statusController.add(status);
      return status;
    } catch (e) {
      debugPrint(
        'ReactiveBluetoothService readStatus error: $e - Control Service may require bonding',
      );
      return null;
    }
  }

  Future<bool> writeLedControl(int value) async {
    if (connectedDeviceId == null) return false;

    try {
      final characteristic = QualifiedCharacteristic(
        serviceId: Uuid.parse(BleUuids.controlService),
        characteristicId: Uuid.parse(BleUuids.ledControlCharacteristic),
        deviceId: connectedDeviceId!,
      );

      debugPrint('ReactiveBluetoothService writeLedControl value: $value');
      await _flutterReactiveBle.writeCharacteristicWithoutResponse(
        characteristic,
        value: [value],
      );
      return true;
    } catch (e) {
      debugPrint(
        'ReactiveBluetoothService writeLedControl error: $e - Control Service may require bonding',
      );
      return false;
    }
  }

  Future<bool> writeCommand(String command) async {
    if (connectedDeviceId == null) return false;

    try {
      final characteristic = QualifiedCharacteristic(
        serviceId: Uuid.parse(BleUuids.controlService),
        characteristicId: Uuid.parse(BleUuids.commandCharacteristic),
        deviceId: connectedDeviceId!,
      );

      debugPrint('ReactiveBluetoothService writeCommand command: $command');
      await _flutterReactiveBle.writeCharacteristicWithResponse(
        characteristic,
        value: utf8.encode(command),
      );
      return true;
    } catch (e) {
      debugPrint(
        'ReactiveBluetoothService writeCommand error: $e - Control Service may require bonding',
      );
      return false;
    }
  }

  Future<bool> writeStatus(String status) async {
    if (connectedDeviceId == null) return false;

    try {
      final characteristic = QualifiedCharacteristic(
        serviceId: Uuid.parse(BleUuids.controlService),
        characteristicId: Uuid.parse(BleUuids.statusCharacteristic),
        deviceId: connectedDeviceId!,
      );

      debugPrint('ReactiveBluetoothService writeStatus status: $status');
      await _flutterReactiveBle.writeCharacteristicWithResponse(
        characteristic,
        value: utf8.encode(status),
      );
      return true;
    } catch (e) {
      debugPrint(
        'ReactiveBluetoothService writeStatus error: $e - Control Service may require bonding',
      );
      return false;
    }
  }

  void dispose() {
    _connectionSubscription?.cancel();
    _scanSubscription?.cancel();
    _characteristicSubscription?.cancel();
    _deviceNameController.close();
    _firmwareVersionController.close();
    _temperatureController.close();
    _humidityController.close();
    _batteryLevelController.close();
    _statusController.close();
    _scanResultsController.close();
  }
}
