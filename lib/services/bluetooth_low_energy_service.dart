import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:ble_client_demo/constants/ble_uuids.dart';
import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';
import 'package:flutter/cupertino.dart' hide ConnectionState;

class BluetoothLowEnergyService {
  ConnectionState? connectedDeviceState;
  Peripheral? connectedPeripheral;
  GATTService? deviceInfoService;
  GATTService? sensorDataService;
  GATTService? controlService;
  StreamSubscription? _connectionStateSubscription;

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
    await CentralManager().startDiscovery();
  }

  Future<void> stopScan() async {
    await CentralManager().stopDiscovery();
  }

  Stream<DiscoveredEventArgs> get scanResults => CentralManager().discovered;

  Future<bool> connectToDevice(Peripheral peripheral) async {
    try {
      debugPrint(
        'BluetoothLowEnergyService: Attempting to connect to $peripheral',
      );

      await CentralManager().connect(peripheral);

      // Wait for connection to be established
      final connectionCompleter = Completer<bool>();
      late StreamSubscription subscription;

      subscription = CentralManager().connectionStateChanged.listen((args) {
        debugPrint(
          'Connection state changed: ${args.state} for ${args.peripheral}',
        );
        if (args.peripheral == peripheral) {
          if (args.state == ConnectionState.connected) {
            connectedDeviceState = args.state;
            connectedPeripheral = peripheral;
            if (!connectionCompleter.isCompleted) {
              connectionCompleter.complete(true);
            }
          } else if (args.state == ConnectionState.disconnected) {
            if (!connectionCompleter.isCompleted) {
              connectionCompleter.complete(false);
            }
          }
        }
      });

      final connected = await connectionCompleter.future.timeout(
        const Duration(seconds: 15),
        onTimeout: () => false,
      );

      subscription.cancel();

      if (connected) {
        await _discoverServices();
        await _setupNotifications();
        _setupConnectionMonitoring();
        return true;
      }

      return false;
    } catch (e) {
      debugPrint('BluetoothLowEnergyService connectToDevice error: $e');
      connectedDeviceState = null;
      connectedPeripheral = null;
      return false;
    }
  }

  Future<void> disconnect() async {
    if (connectedPeripheral != null) {
      await CentralManager().disconnect(connectedPeripheral!);
      connectedDeviceState = null;
      connectedPeripheral = null;
    }
    _currentBondedState = false;
    _connectionStateSubscription?.cancel();
    _connectionStateSubscription = null;
  }

  Future<void> _discoverServices() async {
    if (connectedPeripheral == null) return;

    try {
      final services = await CentralManager().discoverGATT(
        connectedPeripheral!,
      );
      debugPrint(
        'BluetoothLowEnergyService: Discovered ${services.length} services',
      );

      for (final service in services) {
        debugPrint('BluetoothLowEnergyService: Service UUID: ${service.uuid}');
        switch (service.uuid.toString().toLowerCase()) {
          case BleUuids.deviceInfoService:
            deviceInfoService = service;
            debugPrint('BluetoothLowEnergyService: Found Device Info Service');
            break;
          case BleUuids.sensorDataService:
            sensorDataService = service;
            debugPrint('BluetoothLowEnergyService: Found Sensor Data Service');
            break;
          case BleUuids.controlService:
            controlService = service;
            debugPrint('BluetoothLowEnergyService: Found Control Service');
            break;
        }
      }
    } catch (e) {
      debugPrint('BluetoothLowEnergyService _discoverServices error: $e');
    }
  }

  Future<void> _setupNotifications() async {
    if (connectedPeripheral == null) return;

    try {
      // Setup notifications for sensor data service
      if (sensorDataService != null) {
        for (final characteristic in sensorDataService!.characteristics) {
          if (characteristic.properties.contains(
            GATTCharacteristicProperty.notify,
          )) {
            debugPrint(
              'BluetoothLowEnergyService: Setting up notification for ${characteristic.uuid}',
            );
            await CentralManager().setCharacteristicNotifyState(
              connectedPeripheral!,
              characteristic,
              state: true,
            );
          }
        }
      }

      // Setup notifications for control service
      if (controlService != null) {
        for (final characteristic in controlService!.characteristics) {
          if (characteristic.properties.contains(
            GATTCharacteristicProperty.notify,
          )) {
            debugPrint(
              'BluetoothLowEnergyService: Setting up notification for ${characteristic.uuid}',
            );
            await CentralManager().setCharacteristicNotifyState(
              connectedPeripheral!,
              characteristic,
              state: true,
            );
          }
        }
      }

      // Listen for characteristic value changes
      CentralManager().characteristicNotified.listen((args) {
        if (args.peripheral == connectedPeripheral) {
          _handleNotification(args.characteristic.uuid.toString(), args.value);
        }
      });
    } catch (e) {
      debugPrint('BluetoothLowEnergyService _setupNotifications error: $e');
    }
  }

  void _setupConnectionMonitoring() {
    if (connectedPeripheral == null) return;

    _connectionStateSubscription?.cancel();

    _connectionStateSubscription = CentralManager().connectionStateChanged.listen((
      args,
    ) {
      if (args.peripheral == connectedPeripheral) {
        debugPrint(
          'BluetoothLowEnergyService: Connection state changed to: ${args.state}',
        );
        if (args.state == ConnectionState.disconnected) {
          connectedDeviceState = null;
          connectedPeripheral = null;
          _currentBondedState = false;
          _bondedController.add(false);
        }
      }
    });
  }

  void _handleNotification(String uuid, Uint8List value) {
    debugPrint(
      'BluetoothLowEnergyService: Received notification for $uuid with value: $value',
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
    final characteristic = _findCharacteristic(
      deviceInfoService,
      BleUuids.deviceNameCharacteristic,
    );

    if (characteristic == null || connectedPeripheral == null) {
      return null;
    }

    try {
      final value = await CentralManager().readCharacteristic(
        connectedPeripheral!,
        characteristic,
      );
      debugPrint('BluetoothLowEnergyService readDeviceName value: $value');

      final deviceName = utf8.decode(value);
      debugPrint(
        'BluetoothLowEnergyService readDeviceName deviceName: $deviceName',
      );

      _deviceNameController.add(deviceName);
      return deviceName;
    } catch (e) {
      debugPrint('BluetoothLowEnergyService readDeviceName error: $e');
      return null;
    }
  }

  Future<String?> readFirmwareVersion() async {
    final characteristic = _findCharacteristic(
      deviceInfoService,
      BleUuids.firmwareVersionCharacteristic,
    );

    if (characteristic == null || connectedPeripheral == null) {
      return null;
    }

    try {
      final value = await CentralManager().readCharacteristic(
        connectedPeripheral!,
        characteristic,
      );
      debugPrint('BluetoothLowEnergyService readFirmwareVersion value: $value');

      final version = utf8.decode(value);
      debugPrint(
        'BluetoothLowEnergyService readFirmwareVersion version: $version',
      );

      _firmwareVersionController.add(version);
      return version;
    } catch (e) {
      debugPrint('BluetoothLowEnergyService readFirmwareVersion error: $e');
      return null;
    }
  }

  Future<double?> readTemperature() async {
    final characteristic = _findCharacteristic(
      sensorDataService,
      BleUuids.temperatureCharacteristic,
    );

    if (characteristic == null || connectedPeripheral == null) {
      return null;
    }

    try {
      final value = await CentralManager().readCharacteristic(
        connectedPeripheral!,
        characteristic,
      );
      debugPrint('BluetoothLowEnergyService readTemperature value: $value');

      final temperature = _parseTemperature(value);
      debugPrint(
        'BluetoothLowEnergyService readTemperature temperature: $temperature',
      );

      _temperatureController.add(temperature);
      return temperature;
    } catch (e) {
      debugPrint('BluetoothLowEnergyService readTemperature error: $e');
      return null;
    }
  }

  Future<int?> readHumidity() async {
    final characteristic = _findCharacteristic(
      sensorDataService,
      BleUuids.humidityCharacteristic,
    );

    if (characteristic == null || connectedPeripheral == null) {
      return null;
    }

    try {
      final value = await CentralManager().readCharacteristic(
        connectedPeripheral!,
        characteristic,
      );
      debugPrint('BluetoothLowEnergyService readHumidity value: $value');

      final humidity = _parseHumidity(value);
      debugPrint('BluetoothLowEnergyService readHumidity humidity: $humidity');

      _humidityController.add(humidity);
      return humidity;
    } catch (e) {
      debugPrint('BluetoothLowEnergyService readHumidity error: $e');
      return null;
    }
  }

  Future<int?> readBatteryLevel() async {
    final characteristic = _findCharacteristic(
      sensorDataService,
      BleUuids.batteryLevelCharacteristic,
    );

    if (characteristic == null || connectedPeripheral == null) {
      return null;
    }

    try {
      final value = await CentralManager().readCharacteristic(
        connectedPeripheral!,
        characteristic,
      );
      debugPrint('BluetoothLowEnergyService readBatteryLevel value: $value');

      final batteryLevel = _parseBatteryLevel(value);
      debugPrint(
        'BluetoothLowEnergyService readBatteryLevel batteryLevel: $batteryLevel',
      );

      _batteryLevelController.add(batteryLevel);
      return batteryLevel;
    } catch (e) {
      debugPrint('BluetoothLowEnergyService readBatteryLevel error: $e');
      return null;
    }
  }

  Future<String?> readStatus() async {
    final characteristic = _findCharacteristic(
      controlService,
      BleUuids.statusCharacteristic,
    );

    if (characteristic == null || connectedPeripheral == null) {
      return null;
    }

    try {
      final value = await CentralManager().readCharacteristic(
        connectedPeripheral!,
        characteristic,
      );
      debugPrint('BluetoothLowEnergyService readStatus value: $value');

      final status = _parseStatus(value);
      debugPrint('BluetoothLowEnergyService readStatus status: $status');

      _statusController.add(status);
      return status;
    } catch (e) {
      debugPrint(
        'BluetoothLowEnergyService readStatus error: $e - Control Service may require bonding',
      );
      return null;
    }
  }

  Future<bool> writeLedControl(int value) async {
    final characteristic = _findCharacteristic(
      controlService,
      BleUuids.ledControlCharacteristic,
    );

    if (characteristic == null || connectedPeripheral == null) {
      return false;
    }

    try {
      debugPrint('BluetoothLowEnergyService writeLedControl value: $value');
      await CentralManager().writeCharacteristic(
        connectedPeripheral!,
        characteristic,
        value: Uint8List.fromList([value]),
        type: GATTCharacteristicWriteType.withoutResponse,
      );
      return true;
    } catch (e) {
      debugPrint(
        'BluetoothLowEnergyService writeLedControl error: $e - Control Service may require bonding',
      );
      return false;
    }
  }

  Future<bool> writeCommand(String command) async {
    final characteristic = _findCharacteristic(
      controlService,
      BleUuids.commandCharacteristic,
    );

    if (characteristic == null || connectedPeripheral == null) {
      return false;
    }

    try {
      debugPrint('BluetoothLowEnergyService writeCommand command: $command');
      await CentralManager().writeCharacteristic(
        connectedPeripheral!,
        characteristic,
        value: Uint8List.fromList(utf8.encode(command)),
        type: GATTCharacteristicWriteType.withResponse,
      );
      return true;
    } catch (e) {
      debugPrint(
        'BluetoothLowEnergyService writeCommand error: $e - Control Service may require bonding',
      );
      return false;
    }
  }

  Future<bool> writeStatus(String status) async {
    final characteristic = _findCharacteristic(
      controlService,
      BleUuids.statusCharacteristic,
    );

    if (characteristic == null || connectedPeripheral == null) {
      return false;
    }

    try {
      debugPrint('BluetoothLowEnergyService writeStatus status: $status');
      await CentralManager().writeCharacteristic(
        connectedPeripheral!,
        characteristic,
        value: Uint8List.fromList(utf8.encode(status)),
        type: GATTCharacteristicWriteType.withResponse,
      );
      return true;
    } catch (e) {
      debugPrint(
        'BluetoothLowEnergyService writeStatus error: $e - Control Service may require bonding',
      );
      return false;
    }
  }

  GATTCharacteristic? _findCharacteristic(GATTService? service, String uuid) {
    if (service == null) return null;

    for (final characteristic in service.characteristics) {
      if (characteristic.uuid.toString().toLowerCase() == uuid) {
        return characteristic;
      }
    }
    return null;
  }

  bool get isConnected => connectedDeviceState == ConnectionState.connected;

  bool get isBonded {
    // bluetooth_low_energy package handles bonding differently
    // For now, return the current state
    return _currentBondedState;
  }

  Future<bool> createBond() async {
    if (connectedPeripheral == null) return false;

    try {
      debugPrint(
        'BluetoothLowEnergyService createBond: Attempting to bond with device $connectedPeripheral',
      );

      // Note: bluetooth_low_energy package may handle bonding automatically
      // during characteristic access that requires encryption
      // For now, we'll simulate bonding by setting the state
      _currentBondedState = true;
      _bondedController.add(true);

      return true;
    } catch (e) {
      debugPrint('BluetoothLowEnergyService createBond error: $e');
      _currentBondedState = false;
      _bondedController.add(false);
      return false;
    }
  }

  Future<bool> removeBond() async {
    if (connectedPeripheral == null) return false;

    try {
      debugPrint(
        'BluetoothLowEnergyService removeBond: Removing bond with device $connectedPeripheral',
      );

      // Note: bluetooth_low_energy package may not have explicit bond removal
      // For now, we'll simulate bond removal by setting the state
      _currentBondedState = false;
      _bondedController.add(false);

      return true;
    } catch (e) {
      debugPrint('BluetoothLowEnergyService removeBond error: $e');
      return false;
    }
  }

  void dispose() {
    _connectionStateSubscription?.cancel();
    _deviceNameController.close();
    _firmwareVersionController.close();
    _temperatureController.close();
    _humidityController.close();
    _batteryLevelController.close();
    _statusController.close();
    _bondedController.close();
  }
}
