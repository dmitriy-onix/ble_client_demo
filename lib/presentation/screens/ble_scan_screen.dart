import 'dart:async';

import 'package:ble_client_demo/core/app_routes.dart';
import 'package:ble_client_demo/core/service_locator.dart';
import 'package:ble_client_demo/models/ble_connection_state.dart';
import 'package:ble_client_demo/services/ble_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleScanScreen extends StatefulWidget {
  const BleScanScreen({super.key});

  @override
  State<BleScanScreen> createState() => _BleScanScreenState();
}

class _BleScanScreenState extends State<BleScanScreen> {
  late final BleService _bleService;
  BleConnectionState _connectionState = const BleConnectionState();
  final List<ScanResult> _scanResults = [];
  StreamSubscription? _scanSubscription;

  @override
  void initState() {
    super.initState();
    _bleService = getIt<BleService>();
    _setupSubscriptions();
  }

  void _setupSubscriptions() {
    _scanSubscription = _bleService.scanResults.listen((results) {
      setState(() {
        _scanResults.clear();
        _scanResults.addAll(results);
      });
    });
  }

  Future<void> _startScan() async {
    if (!await FlutterBluePlus.isSupported) {
      _showError('Bluetooth not supported on this device');
      return;
    }

    final adapterState = await FlutterBluePlus.adapterState.first;
    if (adapterState != BluetoothAdapterState.on) {
      _showError('Please enable Bluetooth');
      return;
    }

    setState(() {
      _connectionState = _connectionState.copyWith(isScanning: true);
      _scanResults.clear();
    });

    try {
      await _bleService.startScan();

      Timer(const Duration(seconds: 15), () {
        if (_connectionState.isScanning) {
          _stopScan();
        }
      });
    } catch (e) {
      _showError('Failed to start scan: $e');
      setState(() {
        _connectionState = _connectionState.copyWith(isScanning: false);
      });
    }
  }

  Future<void> _stopScan() async {
    await _bleService.stopScan();
    setState(() {
      _connectionState = _connectionState.copyWith(isScanning: false);
    });
  }

  Future<void> _connectToDevice(BluetoothDevice device) async {
    setState(() {
      _connectionState = _connectionState.copyWith(
        isConnecting: true,
        isScanning: false,
      );
    });

    await _bleService.stopScan();

    try {
      final success = await _bleService.connectToDevice(device);
      if (success && mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.connected);
      } else {
        _showError('Failed to connect to device');
        setState(() {
          _connectionState = _connectionState.copyWith(isConnecting: false);
        });
      }
    } catch (e) {
      _showError('Connection error: $e');
      setState(() {
        _connectionState = _connectionState.copyWith(isConnecting: false);
      });
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('BLE Device Scanner'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Scan for BLE devices', style: TextStyle(fontSize: 16)),
          ),
          if (_connectionState.isScanning)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          if (_connectionState.isConnecting)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 8),
                  Text('Connecting...'),
                ],
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: _scanResults.length,
              itemBuilder: (context, index) {
                final result = _scanResults[index];
                debugPrint('device: ${result.device}, ${result.advertisementData}');
                return ListTile(
                  leading: const Icon(Icons.bluetooth),
                  title: Text(
                    result.device.platformName.isNotEmpty
                        ? result.device.platformName
                        : 'Unknown Device',
                  ),
                  subtitle: Text(result.device.remoteId.toString()),
                  trailing: Text('${result.rssi} dBm'),
                  onTap: () => _connectToDevice(result.device),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _connectionState.isScanning ? _stopScan : _startScan,
        child: Icon(
          _connectionState.isScanning ? Icons.stop : Icons.bluetooth_searching,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scanSubscription?.cancel();
    super.dispose();
  }
}