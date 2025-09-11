import 'dart:async';
import 'dart:math';

import 'package:ble_client_demo/arch/bloc/base_bloc/base_bloc.dart';
import 'package:ble_client_demo/models/ble_device_data.dart';
import 'package:ble_client_demo/presentation/screens/reactive_connected_screen/bloc/reactive_connected_screen_models.dart';
import 'package:ble_client_demo/presentation/screens/reactive_connected_screen/failures/reactive_connected_failures.dart';
import 'package:ble_client_demo/services/reactive_bluetooth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReactiveConnectedScreenBloc
    extends
        BaseBloc<
          ReactiveConnectedScreenEvent,
          ReactiveConnectedScreenState,
          ReactiveConnectedScreenSR
        > {
  final ReactiveBluetoothService _reactiveBluetoothService;

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

  ReactiveConnectedScreenBloc({required ReactiveBluetoothService reactiveBluetoothService})
    : _reactiveBluetoothService = reactiveBluetoothService,
      super(const ReactiveConnectedScreenState(deviceData: BleDeviceData())) {
    on<InitEvent>(_onInit);
    on<UpdateDeviceDataEvent>(_onUpdateDeviceData);
    on<ReadDeviceInfoEvent>(_onReadDeviceInfo);
    on<ToggleLedEvent>(_onToggleLed);
    on<SendRandomCommandEvent>(_onSendRandomCommand);
    on<UpdateRandomStatusEvent>(_onUpdateRandomStatus);
    on<DisconnectEvent>(_onDisconnect);
  }

  FutureOr<void> _onInit(InitEvent event, Emitter<ReactiveConnectedScreenState> emit) {
    _setupSubscriptions();
    add(const ReactiveConnectedScreenEvent.readDeviceInfo());
  }

  void _setupSubscriptions() {
    _deviceNameSubscription = _reactiveBluetoothService.deviceNameStream.listen((name) {
      add(
        ReactiveConnectedScreenEvent.updateDeviceData(
          state.deviceData.copyWith(deviceName: name),
        ),
      );
    });

    _firmwareVersionSubscription = _reactiveBluetoothService.firmwareVersionStream.listen((
      version,
    ) {
      add(
        ReactiveConnectedScreenEvent.updateDeviceData(
          state.deviceData.copyWith(firmwareVersion: version),
        ),
      );
    });

    _temperatureSubscription = _reactiveBluetoothService.temperatureStream.listen((temp) {
      add(
        ReactiveConnectedScreenEvent.updateDeviceData(
          state.deviceData.copyWith(temperature: temp),
        ),
      );
    });

    _humiditySubscription = _reactiveBluetoothService.humidityStream.listen((humidity) {
      add(
        ReactiveConnectedScreenEvent.updateDeviceData(
          state.deviceData.copyWith(humidity: humidity),
        ),
      );
    });

    _batterySubscription = _reactiveBluetoothService.batteryLevelStream.listen((battery) {
      add(
        ReactiveConnectedScreenEvent.updateDeviceData(
          state.deviceData.copyWith(batteryLevel: battery),
        ),
      );
    });

    _statusSubscription = _reactiveBluetoothService.statusStream.listen((status) {
      add(
        ReactiveConnectedScreenEvent.updateDeviceData(
          state.deviceData.copyWith(status: status),
        ),
      );
    });
  }

  FutureOr<void> _onUpdateDeviceData(
    UpdateDeviceDataEvent event,
    Emitter<ReactiveConnectedScreenState> emit,
  ) {
    emit(state.copyWith(deviceData: event.deviceData));
  }

  FutureOr<void> _onReadDeviceInfo(
    ReadDeviceInfoEvent event,
    Emitter<ReactiveConnectedScreenState> emit,
  ) async {
    try {
      await _reactiveBluetoothService.readDeviceName();
      await _reactiveBluetoothService.readFirmwareVersion();
      await _reactiveBluetoothService.readTemperature();
      await _reactiveBluetoothService.readHumidity();
      await _reactiveBluetoothService.readBatteryLevel();
      await _reactiveBluetoothService.readStatus();
    } catch (e) {
      onFailure(ReactiveDeviceReadFailure());
    }
  }

  FutureOr<void> _onToggleLed(
    ToggleLedEvent event,
    Emitter<ReactiveConnectedScreenState> emit,
  ) async {
    final newState = !state.deviceData.ledState;

    try {
      await _reactiveBluetoothService.writeLedControl(newState ? 1 : 0);
      emit(
        state.copyWith(
          deviceData: state.deviceData.copyWith(ledState: newState),
        ),
      );
    } catch (e) {
      onFailure(ReactiveLedControlFailure());
    }
  }

  FutureOr<void> _onSendRandomCommand(
    SendRandomCommandEvent event,
    Emitter<ReactiveConnectedScreenState> emit,
  ) async {
    final random = Random();
    final randomIndex = random.nextInt(_availableCommands.length);
    final randomCommand = _availableCommands[randomIndex];

    try {
      final success = await _reactiveBluetoothService.writeCommand(randomCommand);
      if (success) {
        addSr(ReactiveConnectedScreenSR.commandSent(randomCommand));
      } else {
        onFailure(ReactiveCommandSendFailure());
      }
    } catch (e) {
      onFailure(ReactiveCommandSendFailure());
    }
  }

  FutureOr<void> _onUpdateRandomStatus(
    UpdateRandomStatusEvent event,
    Emitter<ReactiveConnectedScreenState> emit,
  ) async {
    final currentStatus = state.deviceData.status;
    final availableOptions = _availableStatuses
        .where((status) => status != currentStatus)
        .toList();

    final optionsToUse = availableOptions.isNotEmpty
        ? availableOptions
        : _availableStatuses;

    final random = Random();
    final randomIndex = random.nextInt(optionsToUse.length);
    final randomStatus = optionsToUse[randomIndex];

    try {
      final success = await _reactiveBluetoothService.writeStatus(randomStatus);
      if (success) {
        emit(
          state.copyWith(
            deviceData: state.deviceData.copyWith(status: randomStatus),
          ),
        );
      } else {
        onFailure(ReactiveStatusUpdateFailure());
      }
    } catch (e) {
      onFailure(ReactiveStatusUpdateFailure());
    }
  }

  FutureOr<void> _onDisconnect(
    DisconnectEvent event,
    Emitter<ReactiveConnectedScreenState> emit,
  ) async {
    try {
      await _reactiveBluetoothService.disconnect();
      addSr(const ReactiveConnectedScreenSR.disconnected());
    } catch (e) {
      onFailure(ReactiveDisconnectFailure());
    }
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