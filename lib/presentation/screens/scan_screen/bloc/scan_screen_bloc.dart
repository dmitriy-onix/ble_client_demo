import 'dart:async';

import 'package:ble_client_demo/arch/bloc/base_bloc/base_bloc.dart';
import 'package:ble_client_demo/models/ble_connection_state.dart';
import 'package:ble_client_demo/presentation/screens/scan_screen/bloc/scan_screen_models.dart';
import 'package:ble_client_demo/presentation/screens/scan_screen/failures/scan_failures.dart';
import 'package:ble_client_demo/services/ble_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ScanScreenBloc
    extends BaseBloc<ScanScreenEvent, ScanScreenState, ScanScreenSR> {
  final BleService _bleService;

  StreamSubscription? _scanSubscription;

  ScanScreenBloc({required BleService bleService})
    : _bleService = bleService,
      super(ScanScreenState(connectionState: BleConnectionState.empty())) {
    on<InitEvent>(_onInit);
    on<UpdateScanResultsEvent>(_onUpdateScanResults);
    on<StartScanEvent>(_onStartScan);
    on<StopScanEvent>(_onStopScan);
    on<ConnectDeviceEvent>(_onConnectDevice);
  }

  FutureOr<void> _onInit(InitEvent event, Emitter<ScanScreenState> emit) {
    _scanSubscription = _bleService.scanResults.listen((results) {
      add(ScanScreenEvent.updateScanResults(results));
    });
  }

  FutureOr<void> _onUpdateScanResults(
    UpdateScanResultsEvent event,
    Emitter<ScanScreenState> emit,
  ) {
    final scanResults = List.of(state.scanResults);

    scanResults.clear();
    scanResults.addAll(event.results);

    emit(state.copyWith(scanResults: scanResults));
  }

  FutureOr<void> _onStartScan(
    StartScanEvent event,
    Emitter<ScanScreenState> emit,
  ) async {
    if (!await FlutterBluePlus.isSupported) {
      onFailure(BluetoothNotSupportedFailure());
      return;
    }

    final adapterState = await FlutterBluePlus.adapterState.first;
    if (adapterState != BluetoothAdapterState.on) {
      onFailure(BluetoothDisabledFailure());
      return;
    }

    emit(
      state.copyWith(
        connectionState: state.connectionState.copyWith(isScanning: true),
        scanResults: [],
      ),
    );

    try {
      await _bleService.startScan();

      Timer(const Duration(seconds: 15), () {
        if (state.connectionState.isScanning) {
          add(ScanScreenEvent.stopScan());
        }
      });
    } catch (e) {
      onFailure(ScanStartFailure());
      emit(
        state.copyWith(
          connectionState: state.connectionState.copyWith(isScanning: false),
        ),
      );
    }
  }

  FutureOr<void> _onStopScan(
    StopScanEvent event,
    Emitter<ScanScreenState> emit,
  ) async {
    await _bleService.stopScan();

    emit(
      state.copyWith(
        connectionState: state.connectionState.copyWith(isScanning: false),
      ),
    );
  }

  FutureOr<void> _onConnectDevice(
    ConnectDeviceEvent event,
    Emitter<ScanScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        connectionState: state.connectionState.copyWith(
          isScanning: false,
          isConnecting: true,
        ),
      ),
    );

    await _bleService.stopScan();

    try {
      final success = await _bleService.connectToDevice(event.device);
      if (success) {
        addSr(const ScanScreenSR.deviceConnected());
      } else {
        onFailure(DeviceConnectionFailure());

        emit(
          state.copyWith(
            connectionState: state.connectionState.copyWith(
              isConnecting: false,
            ),
          ),
        );
      }
    } catch (e) {
      onFailure(DeviceConnectionFailure());

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
