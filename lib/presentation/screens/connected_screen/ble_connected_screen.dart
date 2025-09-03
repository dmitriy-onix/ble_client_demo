import 'dart:async';
import 'dart:math';

import 'package:ble_client_demo/core/app_routes.dart';
import 'package:ble_client_demo/core/service_locator.dart';
import 'package:ble_client_demo/models/ble_device_data.dart';
import 'package:ble_client_demo/services/ble_service.dart';
import 'package:flutter/material.dart';

import 'widgets/actions_card.dart';
import 'widgets/control_card.dart';
import 'widgets/device_info_card.dart';
import 'widgets/sensor_data_card.dart';

class BleConnectedScreen extends StatefulWidget {
  const BleConnectedScreen({super.key});

  @override
  State<BleConnectedScreen> createState() => _BleConnectedScreenState();
}

class _BleConnectedScreenState extends State<BleConnectedScreen> {
  late final BleService _bleService;
  BleDeviceData _deviceData = const BleDeviceData();
  StreamSubscription? _deviceNameSubscription;
  StreamSubscription? _firmwareVersionSubscription;
  StreamSubscription? _temperatureSubscription;
  StreamSubscription? _humiditySubscription;
  StreamSubscription? _batterySubscription;
  StreamSubscription? _statusSubscription;

  static const List<String> _availableCommands = [
    'ping',
    'reset',
    'status',
    'hello',
    'test',
  ];

  static const List<String> _availableStatuses = [
    'idle',
    'ready',
    'busy',
    'error',
  ];

  @override
  void initState() {
    super.initState();
    _bleService = getIt<BleService>();
    _setupSubscriptions();
    _readDeviceInfo();
  }

  void _setupSubscriptions() {
    _deviceNameSubscription = _bleService.deviceNameStream.listen((name) {
      setState(() {
        _deviceData = _deviceData.copyWith(deviceName: name);
      });
    });

    _firmwareVersionSubscription = _bleService.firmwareVersionStream.listen((
      name,
    ) {
      setState(() {
        _deviceData = _deviceData.copyWith(firmwareVersion: name);
      });
    });

    _temperatureSubscription = _bleService.temperatureStream.listen((temp) {
      setState(() {
        _deviceData = _deviceData.copyWith(temperature: temp);
      });
    });

    _humiditySubscription = _bleService.humidityStream.listen((humidity) {
      setState(() {
        _deviceData = _deviceData.copyWith(humidity: humidity);
      });
    });

    _batterySubscription = _bleService.batteryLevelStream.listen((battery) {
      setState(() {
        _deviceData = _deviceData.copyWith(batteryLevel: battery);
      });
    });

    _statusSubscription = _bleService.statusStream.listen((status) {
      setState(() {
        _deviceData = _deviceData.copyWith(status: status);
      });
    });
  }

  Future<void> _readDeviceInfo() async {
    await _bleService.readDeviceName();
    await _bleService.readFirmwareVersion();
    await _bleService.readTemperature();
    await _bleService.readHumidity();
    await _bleService.readBatteryLevel();
    await _bleService.readStatus();
  }

  Future<void> _disconnect() async {
    await _bleService.disconnect();
    if (mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.scan);
    }
  }

  Future<void> _toggleLed() async {
    final newState = !_deviceData.ledState;
    final success = await _bleService.writeLedControl(newState ? 1 : 0);
    if (success) {
      setState(() {
        _deviceData = _deviceData.copyWith(ledState: newState);
      });
    }
  }

  Future<void> _sendRandomCommand(BuildContext context) async {
    final random = Random();
    final randomIndex = random.nextInt(_availableCommands.length);
    final randomCommand = _availableCommands[randomIndex];
    await _bleService.writeCommand(randomCommand);

    if (!context.mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sent command: $randomCommand'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _updateRandomStatus(BuildContext context) async {
    final currentStatus = _deviceData.status;
    final availableOptions = _availableStatuses
        .where((status) => status != currentStatus)
        .toList();

    final optionsToUse = availableOptions.isNotEmpty
        ? availableOptions
        : _availableStatuses;

    final random = Random();
    final randomIndex = random.nextInt(optionsToUse.length);
    final randomStatus = optionsToUse[randomIndex];
    final success = await _bleService.writeStatus(randomStatus);

    if (!context.mounted) {
      return;
    }

    if (success) {
      setState(() {
        _deviceData = _deviceData.copyWith(status: randomStatus);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update status'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Connected Device'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bluetooth_disabled),
            onPressed: _disconnect,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DeviceInfoCard(deviceData: _deviceData),
            const SizedBox(height: 16),
            SensorDataCard(deviceData: _deviceData),
            const SizedBox(height: 16),
            ControlCard(deviceData: _deviceData, onToggleLed: _toggleLed),
            const SizedBox(height: 16),
            ActionsCard(
              onRefreshData: _readDeviceInfo,
              onSendRandomCommand: () => _sendRandomCommand(context),
              onUpdateRandomStatus: () => _updateRandomStatus(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _deviceNameSubscription?.cancel();
    _firmwareVersionSubscription?.cancel();
    _temperatureSubscription?.cancel();
    _humiditySubscription?.cancel();
    _batterySubscription?.cancel();
    _statusSubscription?.cancel();
    super.dispose();
  }
}
