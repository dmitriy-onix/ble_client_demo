import 'dart:async';
import 'dart:math';

import 'package:ble_client_demo/arch/bloc/base_bloc/base_bloc.dart';
import 'package:ble_client_demo/models/ble_device_data.dart';
import 'package:ble_client_demo/presentation/screens/ble_connected_screen/bloc/ble_connected_screen_models.dart';
import 'package:ble_client_demo/presentation/screens/ble_connected_screen/failures/ble_connected_failures.dart';
import 'package:ble_client_demo/services/bluetooth_low_energy_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BleConnectedScreenBloc extends BaseBloc<BleConnectedScreenEvent,
    BleConnectedScreenState, BleConnectedScreenSR> {
  final BluetoothLowEnergyService _bluetoothLowEnergyService;

  late StreamSubscription _deviceNameSubscription;
  late StreamSubscription _firmwareVersionSubscription;
  late StreamSubscription _temperatureSubscription;
  late StreamSubscription _humiditySubscription;
  late StreamSubscription _batteryLevelSubscription;
  late StreamSubscription _statusSubscription;
  late StreamSubscription _bondedSubscription;

  BleConnectedScreenBloc({
    required BluetoothLowEnergyService bluetoothLowEnergyService,
  })  : _bluetoothLowEnergyService = bluetoothLowEnergyService,
        super(BleConnectedScreenState(deviceData: BleDeviceData())) {
    on<InitEvent>(_onInit);
    on<UpdateDeviceDataEvent>(_onUpdateDeviceData);
    on<ReadDeviceInfoEvent>(_onReadDeviceInfo);
    on<ToggleLedEvent>(_onToggleLed);
    on<SendRandomCommandEvent>(_onSendRandomCommand);
    on<UpdateRandomStatusEvent>(_onUpdateRandomStatus);
    on<DisconnectEvent>(_onDisconnect);
  }

  FutureOr<void> _onInit(InitEvent event, Emitter<BleConnectedScreenState> emit) {
    _deviceNameSubscription = _bluetoothLowEnergyService.deviceNameStream.listen((name) {
      add(BleConnectedScreenEvent.updateDeviceData(
        state.deviceData.copyWith(deviceName: name),
      ));
    });

    _firmwareVersionSubscription = _bluetoothLowEnergyService.firmwareVersionStream.listen((version) {
      add(BleConnectedScreenEvent.updateDeviceData(
        state.deviceData.copyWith(firmwareVersion: version),
      ));
    });

    _temperatureSubscription = _bluetoothLowEnergyService.temperatureStream.listen((temperature) {
      add(BleConnectedScreenEvent.updateDeviceData(
        state.deviceData.copyWith(temperature: temperature),
      ));
    });

    _humiditySubscription = _bluetoothLowEnergyService.humidityStream.listen((humidity) {
      add(BleConnectedScreenEvent.updateDeviceData(
        state.deviceData.copyWith(humidity: humidity),
      ));
    });

    _batteryLevelSubscription = _bluetoothLowEnergyService.batteryLevelStream.listen((battery) {
      add(BleConnectedScreenEvent.updateDeviceData(
        state.deviceData.copyWith(batteryLevel: battery),
      ));
    });

    _statusSubscription = _bluetoothLowEnergyService.statusStream.listen((status) {
      add(BleConnectedScreenEvent.updateDeviceData(
        state.deviceData.copyWith(status: status),
      ));
    });

    // Start reading device info
    add(const BleConnectedScreenEvent.readDeviceInfo());
  }

  FutureOr<void> _onUpdateDeviceData(
    UpdateDeviceDataEvent event,
    Emitter<BleConnectedScreenState> emit,
  ) {
    emit(state.copyWith(deviceData: event.deviceData));
  }

  FutureOr<void> _onReadDeviceInfo(
    ReadDeviceInfoEvent event,
    Emitter<BleConnectedScreenState> emit,
  ) async {
    try {
      await _bluetoothLowEnergyService.readDeviceName();
      await _bluetoothLowEnergyService.readFirmwareVersion();
      await _bluetoothLowEnergyService.readStatus();
      await _bluetoothLowEnergyService.readHumidity();
      await _bluetoothLowEnergyService.readTemperature();
      await _bluetoothLowEnergyService.readBatteryLevel();
    } catch (e) {
      onFailure(BleReadCharacteristicFailure());
    }
  }

  FutureOr<void> _onToggleLed(
    ToggleLedEvent event,
    Emitter<BleConnectedScreenState> emit,
  ) async {
    final newState = !state.deviceData.ledState;

    try {
      await _bluetoothLowEnergyService.writeLedControl(newState ? 1 : 0);
      emit(
        state.copyWith(
          deviceData: state.deviceData.copyWith(ledState: newState),
        ),
      );
    } catch (e) {
      onFailure(BleWriteCharacteristicFailure());
    }
  }

  FutureOr<void> _onSendRandomCommand(
    SendRandomCommandEvent event,
    Emitter<BleConnectedScreenState> emit,
  ) async {
    try {
      final commands = ['START', 'STOP', 'RESET', 'STATUS'];
      final randomCommand = commands[Random().nextInt(commands.length)];

      await _bluetoothLowEnergyService.writeCommand(randomCommand);
      addSr(BleConnectedScreenSR.commandSent(randomCommand));
    } catch (e) {
      onFailure(BleWriteCharacteristicFailure());
    }
  }

  FutureOr<void> _onUpdateRandomStatus(
    UpdateRandomStatusEvent event,
    Emitter<BleConnectedScreenState> emit,
  ) async {
    try {
      final statuses = ['ACTIVE', 'IDLE', 'READY', 'BUSY'];
      final randomStatus = statuses[Random().nextInt(statuses.length)];

      await _bluetoothLowEnergyService.writeStatus(randomStatus);
    } catch (e) {
      onFailure(BleWriteCharacteristicFailure());
    }
  }

  FutureOr<void> _onDisconnect(
    DisconnectEvent event,
    Emitter<BleConnectedScreenState> emit,
  ) async {
    try {
      await _bluetoothLowEnergyService.disconnect();
      addSr(const BleConnectedScreenSR.disconnected());
    } catch (e) {
      onFailure(BleDeviceDisconnectedFailure());
    }
  }

  @override
  void dispose() {
    _deviceNameSubscription.cancel();
    _firmwareVersionSubscription.cancel();
    _temperatureSubscription.cancel();
    _humiditySubscription.cancel();
    _batteryLevelSubscription.cancel();
    _statusSubscription.cancel();
    _bondedSubscription.cancel();
    super.dispose();
  }
}