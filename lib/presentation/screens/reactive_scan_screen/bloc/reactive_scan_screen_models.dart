import 'package:ble_client_demo/models/ble_connection_state.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reactive_scan_screen_models.freezed.dart';

@freezed
class ReactiveScanScreenEvent with _$ReactiveScanScreenEvent {
  const factory ReactiveScanScreenEvent.init() = InitEvent;

  const factory ReactiveScanScreenEvent.startScan() = StartScanEvent;

  const factory ReactiveScanScreenEvent.stopScan() = StopScanEvent;

  const factory ReactiveScanScreenEvent.connectDevice(String deviceId) =
      ConnectDeviceEvent;

  const factory ReactiveScanScreenEvent.updateScanResults(List<DiscoveredDevice> results) =
      UpdateScanResultsEvent;
}

@freezed
abstract class ReactiveScanScreenState with _$ReactiveScanScreenState {
  const factory ReactiveScanScreenState({
    required BleConnectionState connectionState,
    @Default([]) List<DiscoveredDevice> scanResults,
  }) = _ReactiveScanScreenState;
}

@freezed
class ReactiveScanScreenSR with _$ReactiveScanScreenSR {
  const factory ReactiveScanScreenSR.deviceConnected() = _DeviceConnected;
}