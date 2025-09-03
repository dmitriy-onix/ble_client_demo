import 'dart:async';

import 'package:ble_client_demo/arch/bloc/base_bloc/base_bloc_state.dart';
import 'package:ble_client_demo/arch/domain/failure/failure.dart';
import 'package:ble_client_demo/core/app_routes.dart';
import 'package:ble_client_demo/core/service_locator.dart';
import 'package:ble_client_demo/models/ble_connection_state.dart';
import 'package:ble_client_demo/presentation/screens/scan_screen/bloc/scan_screen_bloc.dart';
import 'package:ble_client_demo/presentation/screens/scan_screen/bloc/scan_screen_models.dart';
import 'package:ble_client_demo/presentation/screens/scan_screen/failures/scan_failures.dart';
import 'package:ble_client_demo/services/ble_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleScanScreen extends StatefulWidget {
  const BleScanScreen({super.key});

  @override
  State<BleScanScreen> createState() => _BleScanScreenState();
}

class _BleScanScreenState
    extends
        BaseState<
          ScanScreenState,
          ScanScreenBloc,
          ScanScreenSR,
          BleScanScreen
        > {
  @override
  ScanScreenBloc createBloc() =>
      ScanScreenBloc(bleService: getIt<BleService>());

  @override
  void onBlocCreated(BuildContext context, ScanScreenBloc bloc) {
    bloc.add(ScanScreenEvent.init());
    super.onBlocCreated(context, bloc);
  }

  @override
  Widget buildWidget(BuildContext context) {
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
          BlocSelector<ScanScreenBloc, ScanScreenState, BleConnectionState>(
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
                    final result = state.scanResults[index];
                    debugPrint(
                      'device: ${result.device}, ${result.advertisementData}',
                    );
                    return ListTile(
                      leading: const Icon(Icons.bluetooth),
                      title: Text(
                        result.device.platformName.isNotEmpty
                            ? result.device.platformName
                            : 'Unknown Device',
                      ),
                      subtitle: Text(result.device.remoteId.toString()),
                      trailing: Text('${result.rssi} dBm'),
                      onTap: () => _connectToDevice(context, result.device),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton:
          BlocSelector<ScanScreenBloc, ScanScreenState, BleConnectionState>(
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
    blocOf(context).add(ScanScreenEvent.startScan());
  }

  Future<void> _stopScan(BuildContext context) async {
    blocOf(context).add(ScanScreenEvent.stopScan());
  }

  Future<void> _connectToDevice(
    BuildContext context,
    BluetoothDevice device,
  ) async {
    blocOf(context).add(ScanScreenEvent.connectDevice(device));
  }

  @override
  void onSR(BuildContext context, ScanScreenSR sr) {
    sr.when(
      deviceConnected: () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, AppRoutes.connected);
        }
      },
    );
    super.onSR(context, sr);
  }

  @override
  void onFailure(BuildContext context, Failure failure) {
    if (failure is ScanFailure) {
      _handleScanFailure(failure);
    }

    super.onFailure(context, failure);
  }

  void _handleScanFailure(ScanFailure failure) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(failure.message), backgroundColor: Colors.red),
    );
  }
}
