import 'dart:async';

import 'package:ble_client_demo/arch/bloc/base_bloc/base_bloc_state.dart';
import 'package:ble_client_demo/arch/domain/failure/failure.dart';
import 'package:ble_client_demo/core/app_routes.dart';
import 'package:ble_client_demo/core/service_locator.dart';
import 'package:ble_client_demo/models/ble_connection_state.dart';
import 'package:ble_client_demo/presentation/screens/ble_scan_screen/bloc/ble_scan_screen_bloc.dart';
import 'package:ble_client_demo/presentation/screens/ble_scan_screen/bloc/ble_scan_screen_models.dart';
import 'package:ble_client_demo/presentation/screens/ble_scan_screen/failures/ble_scan_failures.dart';
import 'package:ble_client_demo/services/bluetooth_low_energy_service.dart';
import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BleScanScreen extends StatefulWidget {
  const BleScanScreen({super.key});

  @override
  State<BleScanScreen> createState() => _BleScanScreenState();
}

class _BleScanScreenState
    extends
        BaseState<
          BleScanScreenState,
          BleScanScreenBloc,
          BleScanScreenSR,
          BleScanScreen
        > {
  @override
  BleScanScreenBloc createBloc() =>
      BleScanScreenBloc(bluetoothLowEnergyService: getIt<BluetoothLowEnergyService>());

  @override
  void onBlocCreated(BuildContext context, BleScanScreenBloc bloc) {
    bloc.add(BleScanScreenEvent.init());
    super.onBlocCreated(context, bloc);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('BLE Scanner'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Scan for BLE devices (bluetooth_low_energy)', style: TextStyle(fontSize: 16)),
          ),
          BlocSelector<BleScanScreenBloc, BleScanScreenState, BleConnectionState>(
            selector: (state) {
              return state.connectionState;
            },
            builder: (context, connectedState) {
              if (connectedState.isScanning) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                );
              }
              if (connectedState.isConnecting) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 8),
                      Text('Connecting...'),
                    ],
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
          Expanded(
            child: blocBuilder(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.scanResults.length,
                  itemBuilder: (context, index) {
                    final discoveredArgs = state.scanResults[index];
                    final peripheral = discoveredArgs.peripheral;
                    final advertisement = discoveredArgs.advertisement;
                    debugPrint(
                      'peripheral: ${advertisement.name}, ${peripheral.uuid}',
                    );
                    return ListTile(
                      leading: const Icon(Icons.bluetooth),
                      title: Text(
                        (advertisement.name?.isNotEmpty ?? false)
                            ? advertisement.name.toString()
                            : 'Unknown Device',
                      ),
                      subtitle: Text(peripheral.uuid.toString()),
                      trailing: Text('${discoveredArgs.rssi} dBm'),
                      onTap: () => _connectToDevice(context, peripheral),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton:
          BlocSelector<BleScanScreenBloc, BleScanScreenState, BleConnectionState>(
            selector: (state) {
              return state.connectionState;
            },
            builder: (context, connectedState) {
              return FloatingActionButton(
                onPressed: () => connectedState.isScanning
                    ? _stopScan(context)
                    : _startScan(context),
                child: Icon(
                  connectedState.isScanning
                      ? Icons.stop
                      : Icons.bluetooth_searching,
                ),
              );
            },
          ),
    );
  }

  Future<void> _startScan(BuildContext context) async {
    blocOf(context).add(BleScanScreenEvent.startScan());
  }

  Future<void> _stopScan(BuildContext context) async {
    blocOf(context).add(BleScanScreenEvent.stopScan());
  }

  Future<void> _connectToDevice(
    BuildContext context,
    Peripheral peripheral,
  ) async {
    blocOf(context).add(BleScanScreenEvent.connectDevice(peripheral));
  }

  @override
  void onSR(BuildContext context, BleScanScreenSR sr) {
    sr.when(
      deviceConnected: () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, AppRoutes.bleConnected);
        }
      },
    );
    super.onSR(context, sr);
  }

  @override
  void onFailure(BuildContext context, Failure failure) {
    if (failure is BleScanFailure) {
      _handleScanFailure(failure);
    }

    super.onFailure(context, failure);
  }

  void _handleScanFailure(BleScanFailure failure) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(failure.message), backgroundColor: Colors.red),
    );
  }
}