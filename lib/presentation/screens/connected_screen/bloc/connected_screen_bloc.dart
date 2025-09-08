import 'dart:async';
import 'dart:math';

import 'package:ble_client_demo/arch/bloc/base_bloc/base_bloc.dart';
import 'package:ble_client_demo/models/ble_device_data.dart';
import 'package:ble_client_demo/presentation/screens/connected_screen/bloc/connected_screen_models.dart';
import 'package:ble_client_demo/presentation/screens/connected_screen/failures/connected_failures.dart';
import 'package:ble_client_demo/services/ble_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectedScreenBloc
    extends
        BaseBloc<
          ConnectedScreenEvent,
          ConnectedScreenState,
          ConnectedScreenSR
        > {
  final BleService _bleService;

  StreamSubscription? _deviceNameSubscription;
  StreamSubscription? _firmwareVersionSubscription;
  StreamSubscription? _temperatureSubscription;
  StreamSubscription? _humiditySubscription;
  StreamSubscription? _batterySubscription;
  StreamSubscription? _statusSubscription;
  StreamSubscription? _bondedSubscription;

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

  ConnectedScreenBloc({required BleService bleService})
    : _bleService = bleService,
      super(const ConnectedScreenState(deviceData: BleDeviceData())) {
    on<InitEvent>(_onInit);
    on<UpdateDeviceDataEvent>(_onUpdateDeviceData);
    on<ReadDeviceInfoEvent>(_onReadDeviceInfo);
    on<ToggleLedEvent>(_onToggleLed);
    on<SendRandomCommandEvent>(_onSendRandomCommand);
    on<UpdateRandomStatusEvent>(_onUpdateRandomStatus);
    on<DisconnectEvent>(_onDisconnect);
    on<CreateBondEvent>(_onCreateBond);
    on<RemoveBondEvent>(_onRemoveBond);
  }

  FutureOr<void> _onInit(InitEvent event, Emitter<ConnectedScreenState> emit) {
    _setupSubscriptions();
    add(const ConnectedScreenEvent.readDeviceInfo());
  }

  void _setupSubscriptions() {
    _deviceNameSubscription = _bleService.deviceNameStream.listen((name) {
      add(
        ConnectedScreenEvent.updateDeviceData(
          state.deviceData.copyWith(deviceName: name),
        ),
      );
    });

    _firmwareVersionSubscription = _bleService.firmwareVersionStream.listen((
      version,
    ) {
      add(
        ConnectedScreenEvent.updateDeviceData(
          state.deviceData.copyWith(firmwareVersion: version),
        ),
      );
    });

    _temperatureSubscription = _bleService.temperatureStream.listen((temp) {
      add(
        ConnectedScreenEvent.updateDeviceData(
          state.deviceData.copyWith(temperature: temp),
        ),
      );
    });

    _humiditySubscription = _bleService.humidityStream.listen((humidity) {
      add(
        ConnectedScreenEvent.updateDeviceData(
          state.deviceData.copyWith(humidity: humidity),
        ),
      );
    });

    _batterySubscription = _bleService.batteryLevelStream.listen((battery) {
      add(
        ConnectedScreenEvent.updateDeviceData(
          state.deviceData.copyWith(batteryLevel: battery),
        ),
      );
    });

    _statusSubscription = _bleService.statusStream.listen((status) {
      add(
        ConnectedScreenEvent.updateDeviceData(
          state.deviceData.copyWith(status: status),
        ),
      );
    });

    _bondedSubscription = _bleService.bondedStream.listen((bonded) {
      add(
        ConnectedScreenEvent.updateDeviceData(
          state.deviceData.copyWith(isBonded: bonded),
        ),
      );
    });

    final currentBondedState = _bleService.currentBondedState;
    debugPrint(
      '_setupSubscriptions: Current bonded state: $currentBondedState',
    );
    if (currentBondedState != state.deviceData.isBonded) {
      add(
        ConnectedScreenEvent.updateDeviceData(
          state.deviceData.copyWith(isBonded: currentBondedState),
        ),
      );
    }
  }

  FutureOr<void> _onUpdateDeviceData(
    UpdateDeviceDataEvent event,
    Emitter<ConnectedScreenState> emit,
  ) {
    emit(state.copyWith(deviceData: event.deviceData));
  }

  FutureOr<void> _onReadDeviceInfo(
    ReadDeviceInfoEvent event,
    Emitter<ConnectedScreenState> emit,
  ) async {
    try {
      await _bleService.readDeviceName();
      await _bleService.readFirmwareVersion();
      await _bleService.readTemperature();
      await _bleService.readHumidity();
      await _bleService.readBatteryLevel();
      await _bleService.readStatus();
    } catch (e) {
      onFailure(DeviceReadFailure());
    }
  }

  FutureOr<void> _onToggleLed(
    ToggleLedEvent event,
    Emitter<ConnectedScreenState> emit,
  ) async {
    final newState = !state.deviceData.ledState;

    try {
      await _bleService.writeLedControl(newState ? 1 : 0);
      emit(
        state.copyWith(
          deviceData: state.deviceData.copyWith(ledState: newState),
        ),
      );
    } catch (e) {
      onFailure(LedControlFailure());
    }
  }

  FutureOr<void> _onSendRandomCommand(
    SendRandomCommandEvent event,
    Emitter<ConnectedScreenState> emit,
  ) async {
    final random = Random();
    final randomIndex = random.nextInt(_availableCommands.length);
    final randomCommand = _availableCommands[randomIndex];

    try {
      final success = await _bleService.writeCommand(randomCommand);
      if (success) {
        addSr(ConnectedScreenSR.commandSent(randomCommand));
      } else {
        onFailure(CommandSendFailure());
      }
    } catch (e) {
      onFailure(CommandSendFailure());
    }
  }

  FutureOr<void> _onUpdateRandomStatus(
    UpdateRandomStatusEvent event,
    Emitter<ConnectedScreenState> emit,
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
      final success = await _bleService.writeStatus(randomStatus);
      if (success) {
        emit(
          state.copyWith(
            deviceData: state.deviceData.copyWith(status: randomStatus),
          ),
        );
      } else {
        onFailure(StatusUpdateFailure());
      }
    } catch (e) {
      onFailure(StatusUpdateFailure());
    }
  }

  FutureOr<void> _onDisconnect(
    DisconnectEvent event,
    Emitter<ConnectedScreenState> emit,
  ) async {
    try {
      await _bleService.disconnect();
      addSr(const ConnectedScreenSR.disconnected());
    } catch (e) {
      onFailure(DisconnectFailure());
    }
  }

  FutureOr<void> _onCreateBond(
    CreateBondEvent event,
    Emitter<ConnectedScreenState> emit,
  ) async {
    try {
      final success = await _bleService.createBond();
      if (success) {
        addSr(const ConnectedScreenSR.bondingSuccess());
      } else {
        onFailure(BondingFailure());
      }
    } catch (e) {
      onFailure(BondingFailure());
    }
  }

  FutureOr<void> _onRemoveBond(
    RemoveBondEvent event,
    Emitter<ConnectedScreenState> emit,
  ) async {
    try {
      final success = await _bleService.removeBond();
      if (success) {
        addSr(const ConnectedScreenSR.removeBond());
      } else {
        onFailure(BondRemovalFailure());
      }
    } catch (e) {
      onFailure(BondRemovalFailure());
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
    _bondedSubscription?.cancel();
    super.dispose();
  }
}
