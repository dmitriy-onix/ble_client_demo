import 'dart:async';

import 'package:ble_client_demo/arch/bloc/base_bloc/base_bloc.dart';
import 'package:ble_client_demo/models/ble_connection_state.dart';
import 'package:ble_client_demo/presentation/screens/ble_scan_screen/bloc/ble_scan_screen_models.dart';
import 'package:ble_client_demo/presentation/screens/ble_scan_screen/failures/ble_scan_failures.dart';
import 'package:ble_client_demo/services/bluetooth_low_energy_service.dart';
import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BleScanScreenBloc
    extends BaseBloc<BleScanScreenEvent, BleScanScreenState, BleScanScreenSR> {
  final BluetoothLowEnergyService _bluetoothLowEnergyService;

  StreamSubscription? _scanSubscription;

  BleScanScreenBloc({required BluetoothLowEnergyService bluetoothLowEnergyService})
    : _bluetoothLowEnergyService = bluetoothLowEnergyService,
      super(BleScanScreenState(connectionState: BleConnectionState.empty())) {
    on<InitEvent>(_onInit);
    on<UpdateScanResultsEvent>(_onUpdateScanResults);
    on<StartScanEvent>(_onStartScan);
    on<StopScanEvent>(_onStopScan);
    on<ConnectDeviceEvent>(_onConnectDevice);
  }

  FutureOr<void> _onInit(InitEvent event, Emitter<BleScanScreenState> emit) {
    _scanSubscription = _bluetoothLowEnergyService.scanResults.listen((discoveredArgs) {
      final currentResults = List<DiscoveredEventArgs>.from(state.scanResults);

      // Remove existing device with same UUID to avoid duplicates
      currentResults.removeWhere((existingDevice) =>
        existingDevice.peripheral.uuid == discoveredArgs.peripheral.uuid);

      // Add the new/updated device
      currentResults.add(discoveredArgs);

      add(BleScanScreenEvent.updateScanResults(currentResults));
    });
  }

  FutureOr<void> _onUpdateScanResults(
    UpdateScanResultsEvent event,
    Emitter<BleScanScreenState> emit,
  ) {
    emit(state.copyWith(scanResults: event.results));
  }

  FutureOr<void> _onStartScan(
    StartScanEvent event,
    Emitter<BleScanScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        connectionState: state.connectionState.copyWith(isScanning: true),
        scanResults: [],
      ),
    );

    try {
      await _bluetoothLowEnergyService.startScan();

      Timer(const Duration(seconds: 15), () {
        if (state.connectionState.isScanning) {
          add(BleScanScreenEvent.stopScan());
        }
      });
    } catch (e) {
      onFailure(BleScanStartFailure());
      emit(
        state.copyWith(
          connectionState: state.connectionState.copyWith(isScanning: false),
        ),
      );
    }
  }

  FutureOr<void> _onStopScan(
    StopScanEvent event,
    Emitter<BleScanScreenState> emit,
  ) async {
    await _bluetoothLowEnergyService.stopScan();

    emit(
      state.copyWith(
        connectionState: state.connectionState.copyWith(isScanning: false),
      ),
    );
  }

  FutureOr<void> _onConnectDevice(
    ConnectDeviceEvent event,
    Emitter<BleScanScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        connectionState: state.connectionState.copyWith(
          isScanning: false,
          isConnecting: true,
        ),
      ),
    );

    await _bluetoothLowEnergyService.stopScan();

    try {
      final success = await _bluetoothLowEnergyService.connectToDevice(event.peripheral);
      if (success) {
        addSr(const BleScanScreenSR.deviceConnected());
      } else {
        onFailure(BleDeviceConnectionFailure());

        emit(
          state.copyWith(
            connectionState: state.connectionState.copyWith(
              isConnecting: false,
            ),
          ),
        );
      }
    } catch (e) {
      onFailure(BleDeviceConnectionFailure());

      emit(
        state.copyWith(
          connectionState: state.connectionState.copyWith(isConnecting: false),
        ),
      );
    }
  }

  @override
  void dispose() {
    _scanSubscription?.cancel();
    super.dispose();
  }
}