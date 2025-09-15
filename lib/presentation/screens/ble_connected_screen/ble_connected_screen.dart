import 'package:ble_client_demo/arch/bloc/base_bloc/base_bloc_state.dart';
import 'package:ble_client_demo/arch/domain/failure/failure.dart';
import 'package:ble_client_demo/core/app_routes.dart';
import 'package:ble_client_demo/core/service_locator.dart';
import 'package:ble_client_demo/presentation/screens/ble_connected_screen/bloc/ble_connected_screen_bloc.dart';
import 'package:ble_client_demo/presentation/screens/ble_connected_screen/bloc/ble_connected_screen_models.dart';
import 'package:ble_client_demo/presentation/screens/ble_connected_screen/failures/ble_connected_failures.dart';
import 'package:ble_client_demo/services/bluetooth_low_energy_service.dart';
import 'package:flutter/material.dart';

import 'widgets/ble_actions_card.dart';
import 'widgets/ble_control_card.dart';
import 'widgets/ble_device_info_card.dart';
import 'widgets/ble_sensor_data_card.dart';

class BleConnectedScreen extends StatefulWidget {
  const BleConnectedScreen({super.key});

  @override
  State<BleConnectedScreen> createState() => _BleConnectedScreenState();
}

class _BleConnectedScreenState
    extends
        BaseState<
          BleConnectedScreenState,
          BleConnectedScreenBloc,
          BleConnectedScreenSR,
          BleConnectedScreen
        > {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('BLE Connected Device'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bluetooth_disabled),
            onPressed: () =>
                blocOf(context).add(const BleConnectedScreenEvent.disconnect()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Connected Device (bluetooth_low_energy)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            blocBuilder(
              builder: (context, state) {
                return Column(
                  children: [
                    BleDeviceInfoCard(deviceData: state.deviceData),
                    const SizedBox(height: 16),
                    BleSensorDataCard(deviceData: state.deviceData),
                    const SizedBox(height: 16),
                    BleControlCard(deviceData: state.deviceData),
                    const SizedBox(height: 16),
                    const BleActionsCard(),
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  BleConnectedScreenBloc createBloc() => BleConnectedScreenBloc(
        bluetoothLowEnergyService: getIt<BluetoothLowEnergyService>(),
      );

  @override
  void onBlocCreated(BuildContext context, BleConnectedScreenBloc bloc) {
    bloc.add(const BleConnectedScreenEvent.init());
    super.onBlocCreated(context, bloc);
  }

  @override
  void onSR(BuildContext context, BleConnectedScreenSR sr) {
    sr.when(
      disconnected: () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, AppRoutes.bleScan);
        }
      },
      commandSent: (command) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Command sent: $command'),
            backgroundColor: Colors.green,
          ),
        );
      },
      bondCreated: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Device bond created successfully'),
            backgroundColor: Colors.green,
          ),
        );
      },
      bondRemoved: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Device bond removed successfully'),
            backgroundColor: Colors.orange,
          ),
        );
      },
    );
    super.onSR(context, sr);
  }

  @override
  void onFailure(BuildContext context, Failure failure) {
    if (failure is BleConnectedFailure) {
      _handleConnectedFailure(failure);
    }

    super.onFailure(context, failure);
  }

  void _handleConnectedFailure(BleConnectedFailure failure) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(failure.message), backgroundColor: Colors.red),
    );
  }
}