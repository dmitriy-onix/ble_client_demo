import 'package:ble_client_demo/arch/bloc/base_bloc/base_bloc_state.dart';
import 'package:ble_client_demo/arch/domain/failure/failure.dart';
import 'package:ble_client_demo/core/app_routes.dart';
import 'package:ble_client_demo/core/service_locator.dart';
import 'package:ble_client_demo/presentation/screens/reactive_connected_screen/bloc/reactive_connected_screen_bloc.dart';
import 'package:ble_client_demo/presentation/screens/reactive_connected_screen/bloc/reactive_connected_screen_models.dart';
import 'package:ble_client_demo/presentation/screens/reactive_connected_screen/failures/reactive_connected_failures.dart';
import 'package:ble_client_demo/services/reactive_bluetooth_service.dart';
import 'package:flutter/material.dart';

import 'widgets/reactive_actions_card.dart';
import 'widgets/reactive_control_card.dart';
import 'widgets/reactive_device_info_card.dart';
import 'widgets/reactive_sensor_data_card.dart';

class ReactiveConnectedScreen extends StatefulWidget {
  const ReactiveConnectedScreen({super.key});

  @override
  State<ReactiveConnectedScreen> createState() => _ReactiveConnectedScreenState();
}

class _ReactiveConnectedScreenState
    extends
        BaseState<
          ReactiveConnectedScreenState,
          ReactiveConnectedScreenBloc,
          ReactiveConnectedScreenSR,
          ReactiveConnectedScreen
        > {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Reactive Connected Device'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bluetooth_disabled),
            onPressed: () =>
                blocOf(context).add(const ReactiveConnectedScreenEvent.disconnect()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'flutter_reactive_ble Implementation',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
            blocBuilder(
              builder: (context, state) {
                return ReactiveDeviceInfoCard(deviceData: state.deviceData);
              },
            ),
            const SizedBox(height: 16),
            blocBuilder(
              builder: (context, state) {
                return ReactiveSensorDataCard(deviceData: state.deviceData);
              },
            ),
            const SizedBox(height: 16),
            blocBuilder(
              builder: (context, state) {
                return ReactiveControlCard(
                  deviceData: state.deviceData,
                  onToggleLed: () => blocOf(
                    context,
                  ).add(const ReactiveConnectedScreenEvent.toggleLed()),
                );
              },
            ),
            const SizedBox(height: 16),
            ReactiveActionsCard(
              onRefreshData: () => blocOf(
                context,
              ).add(const ReactiveConnectedScreenEvent.readDeviceInfo()),
              onSendRandomCommand: () => blocOf(
                context,
              ).add(const ReactiveConnectedScreenEvent.sendRandomCommand()),
              onUpdateRandomStatus: () => blocOf(
                context,
              ).add(const ReactiveConnectedScreenEvent.updateRandomStatus()),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ReactiveConnectedScreenBloc createBloc() =>
      ReactiveConnectedScreenBloc(reactiveBluetoothService: getIt<ReactiveBluetoothService>());

  @override
  void onBlocCreated(BuildContext context, ReactiveConnectedScreenBloc bloc) {
    bloc.add(const ReactiveConnectedScreenEvent.init());
    super.onBlocCreated(context, bloc);
  }

  @override
  void onSR(BuildContext context, ReactiveConnectedScreenSR sr) {
    sr.when(
      disconnected: () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, AppRoutes.reactiveScan);
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
    );
    super.onSR(context, sr);
  }

  @override
  void onFailure(BuildContext context, Failure failure) {
    if (failure is ReactiveConnectedFailure) {
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