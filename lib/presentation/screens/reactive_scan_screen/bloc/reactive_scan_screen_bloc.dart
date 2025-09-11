import 'dart:async';

import 'package:ble_client_demo/arch/bloc/base_bloc/base_bloc.dart';
import 'package:ble_client_demo/models/ble_connection_state.dart';
import 'package:ble_client_demo/presentation/screens/reactive_scan_screen/bloc/reactive_scan_screen_models.dart';
import 'package:ble_client_demo/presentation/screens/reactive_scan_screen/failures/reactive_scan_failures.dart';
import 'package:ble_client_demo/services/reactive_bluetooth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class ReactiveScanScreenBloc
    extends BaseBloc<ReactiveScanScreenEvent, ReactiveScanScreenState, ReactiveScanScreenSR> {
  final ReactiveBluetoothService _reactiveBluetoothService;

  StreamSubscription? _scanSubscription;

  ReactiveScanScreenBloc({required ReactiveBluetoothService reactiveBluetoothService})
    : _reactiveBluetoothService = reactiveBluetoothService,
      super(ReactiveScanScreenState(connectionState: BleConnectionState.empty())) {
    on<InitEvent>(_onInit);
    on<UpdateScanResultsEvent>(_onUpdateScanResults);
    on<StartScanEvent>(_onStartScan);
    on<StopScanEvent>(_onStopScan);
    on<ConnectDeviceEvent>(_onConnectDevice);
  }

  FutureOr<void> _onInit(InitEvent event, Emitter<ReactiveScanScreenState> emit) {
    _scanSubscription = _reactiveBluetoothService.scanResults.listen((device) {
      final currentResults = List<DiscoveredDevice>.from(state.scanResults);
      
      // Remove existing device with same ID to avoid duplicates
      currentResults.removeWhere((existingDevice) => existingDevice.id == device.id);
      
      // Add the new/updated device
      currentResults.add(device);
      
      add(ReactiveScanScreenEvent.updateScanResults(currentResults));
    });
  }

  FutureOr<void> _onUpdateScanResults(
    UpdateScanResultsEvent event,
    Emitter<ReactiveScanScreenState> emit,
  ) {
    emit(state.copyWith(scanResults: event.results));
  }

  FutureOr<void> _onStartScan(
    StartScanEvent event,
    Emitter<ReactiveScanScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        connectionState: state.connectionState.copyWith(isScanning: true),
        scanResults: [],
      ),
    );

    try {
      await _reactiveBluetoothService.startScan();

      Timer(const Duration(seconds: 15), () {
        if (state.connectionState.isScanning) {
          add(ReactiveScanScreenEvent.stopScan());
        }
      });
    } catch (e) {
      onFailure(ReactiveScanStartFailure());
      emit(
        state.copyWith(
          connectionState: state.connectionState.copyWith(isScanning: false),
        ),
      );
    }
  }

  FutureOr<void> _onStopScan(
    StopScanEvent event,
    Emitter<ReactiveScanScreenState> emit,
  ) async {
    await _reactiveBluetoothService.stopScan();

    emit(
      state.copyWith(
        connectionState: state.connectionState.copyWith(isScanning: false),
      ),
    );
  }

  FutureOr<void> _onConnectDevice(
    ConnectDeviceEvent event,
    Emitter<ReactiveScanScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        connectionState: state.connectionState.copyWith(
          isScanning: false,
          isConnecting: true,
        ),
      ),
    );

    await _reactiveBluetoothService.stopScan();

    try {
      final success = await _reactiveBluetoothService.connectToDevice(event.deviceId);
      if (success) {
        addSr(const ReactiveScanScreenSR.deviceConnected());
      } else {
        onFailure(ReactiveDeviceConnectionFailure());

        emit(
          state.copyWith(
            connectionState: state.connectionState.copyWith(
              isConnecting: false,
            ),
          ),
        );
      }
    } catch (e) {
      onFailure(ReactiveDeviceConnectionFailure());

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