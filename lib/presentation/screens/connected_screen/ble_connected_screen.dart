import 'package:ble_client_demo/arch/bloc/base_bloc/base_bloc_state.dart';
import 'package:ble_client_demo/arch/domain/failure/failure.dart';
import 'package:ble_client_demo/core/app_routes.dart';
import 'package:ble_client_demo/core/service_locator.dart';
import 'package:ble_client_demo/presentation/screens/connected_screen/bloc/connected_screen_bloc.dart';
import 'package:ble_client_demo/presentation/screens/connected_screen/bloc/connected_screen_models.dart';
import 'package:ble_client_demo/presentation/screens/connected_screen/failures/connected_failures.dart';
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

class _BleConnectedScreenState
    extends
        BaseState<
          ConnectedScreenState,
          ConnectedScreenBloc,
          ConnectedScreenSR,
          BleConnectedScreen
        > {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Connected Device'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bluetooth_disabled),
            onPressed: () =>
                blocOf(context).add(const ConnectedScreenEvent.disconnect()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blocBuilder(
              builder: (context, state) {
                return DeviceInfoCard(deviceData: state.deviceData);
              },
            ),
            const SizedBox(height: 16),
            blocBuilder(
              builder: (context, state) {
                return SensorDataCard(deviceData: state.deviceData);
              },
            ),
            const SizedBox(height: 16),
            blocBuilder(
              builder: (context, state) {
                return ControlCard(
                  deviceData: state.deviceData,
                  onToggleLed: () => blocOf(
                    context,
                  ).add(const ConnectedScreenEvent.toggleLed()),
                );
              },
            ),
            const SizedBox(height: 16),
            ActionsCard(
              onRefreshData: () => blocOf(
                context,
              ).add(const ConnectedScreenEvent.readDeviceInfo()),
              onSendRandomCommand: () => blocOf(
                context,
              ).add(const ConnectedScreenEvent.sendRandomCommand()),
              onUpdateRandomStatus: () => blocOf(
                context,
              ).add(const ConnectedScreenEvent.updateRandomStatus()),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ConnectedScreenBloc createBloc() =>
      ConnectedScreenBloc(bleService: getIt<BleService>());

  @override
  void onBlocCreated(BuildContext context, ConnectedScreenBloc bloc) {
    bloc.add(const ConnectedScreenEvent.init());
    super.onBlocCreated(context, bloc);
  }

  @override
  void onSR(BuildContext context, ConnectedScreenSR sr) {
    sr.when(
      disconnected: () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, AppRoutes.scan);
        }
      },
      commandSent: (command) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sent command: $command'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      },
      bondingSuccess: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Device bonded successfully'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );
      },
      removeBond: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Device bond removed'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );
      },
    );
    super.onSR(context, sr);
  }

  @override
  void onFailure(BuildContext context, Failure failure) {
    if (failure is ConnectedFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(failure.message),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    }
    super.onFailure(context, failure);
  }
}
