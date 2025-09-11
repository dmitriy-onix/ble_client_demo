import 'dart:async';

import 'package:ble_client_demo/arch/bloc/base_bloc/base_bloc_state.dart';
import 'package:ble_client_demo/arch/domain/failure/failure.dart';
import 'package:ble_client_demo/core/app_routes.dart';
import 'package:ble_client_demo/core/service_locator.dart';
import 'package:ble_client_demo/models/ble_connection_state.dart';
import 'package:ble_client_demo/presentation/screens/reactive_scan_screen/bloc/reactive_scan_screen_bloc.dart';
import 'package:ble_client_demo/presentation/screens/reactive_scan_screen/bloc/reactive_scan_screen_models.dart';
import 'package:ble_client_demo/presentation/screens/reactive_scan_screen/failures/reactive_scan_failures.dart';
import 'package:ble_client_demo/services/reactive_bluetooth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class ReactiveBleScanScreen extends StatefulWidget {
  const ReactiveBleScanScreen({super.key});

  @override
  State<ReactiveBleScanScreen> createState() => _ReactiveBleScanScreenState();
}

class _ReactiveBleScanScreenState
    extends
        BaseState<
          ReactiveScanScreenState,
          ReactiveScanScreenBloc,
          ReactiveScanScreenSR,
          ReactiveBleScanScreen
        > {
  @override
  ReactiveScanScreenBloc createBloc() =>
      ReactiveScanScreenBloc(reactiveBluetoothService: getIt<ReactiveBluetoothService>());

  @override
  void onBlocCreated(BuildContext context, ReactiveScanScreenBloc bloc) {
    bloc.add(ReactiveScanScreenEvent.init());
    super.onBlocCreated(context, bloc);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Reactive BLE Scanner'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Scan for BLE devices (flutter_reactive_ble)', style: TextStyle(fontSize: 16)),
          ),
          BlocSelector<ReactiveScanScreenBloc, ReactiveScanScreenState, BleConnectionState>(
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
                    final device = state.scanResults[index];
                    debugPrint(
                      'device: ${device.name}, ${device.id}, manufacturerData: ${device.manufacturerData}',
                    );
                    return ListTile(
                      leading: const Icon(Icons.bluetooth),
                      title: Text(
                        device.name.isNotEmpty
                            ? device.name
                            : 'Unknown Device',
                      ),
                      subtitle: Text(device.id),
                      trailing: Text('${device.rssi} dBm'),
                      onTap: () => _connectToDevice(context, device.id),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton:
          BlocSelector<ReactiveScanScreenBloc, ReactiveScanScreenState, BleConnectionState>(
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
    blocOf(context).add(ReactiveScanScreenEvent.startScan());
  }

  Future<void> _stopScan(BuildContext context) async {
    blocOf(context).add(ReactiveScanScreenEvent.stopScan());
  }

  Future<void> _connectToDevice(
    BuildContext context,
    String deviceId,
  ) async {
    blocOf(context).add(ReactiveScanScreenEvent.connectDevice(deviceId));
  }

  @override
  void onSR(BuildContext context, ReactiveScanScreenSR sr) {
    sr.when(
      deviceConnected: () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, AppRoutes.reactiveConnected);
        }
      },
    );
    super.onSR(context, sr);
  }

  @override
  void onFailure(BuildContext context, Failure failure) {
    if (failure is ReactiveScanFailure) {
      _handleScanFailure(failure);
    }

    super.onFailure(context, failure);
  }

  void _handleScanFailure(ReactiveScanFailure failure) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(failure.message), backgroundColor: Colors.red),
    );
  }
}