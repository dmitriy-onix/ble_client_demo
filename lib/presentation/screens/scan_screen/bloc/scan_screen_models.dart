import 'package:ble_client_demo/models/ble_connection_state.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_screen_models.freezed.dart';

@freezed
class ScanScreenEvent with _$ScanScreenEvent {
  const factory ScanScreenEvent.init() = InitEvent;

  const factory ScanScreenEvent.startScan() = StartScanEvent;

  const factory ScanScreenEvent.stopScan() = StopScanEvent;

  const factory ScanScreenEvent.connectDevice(BluetoothDevice device) =
      ConnectDeviceEvent;

  const factory ScanScreenEvent.updateScanResults(List<ScanResult> results) =
      UpdateScanResultsEvent;
}

@freezed
abstract class ScanScreenState with _$ScanScreenState {
  const factory ScanScreenState({
    required BleConnectionState connectionState,
    @Default([]) List<ScanResult> scanResults,
  }) = _ScanScreenState;
}

@freezed
class ScanScreenSR with _$ScanScreenSR {
  const factory ScanScreenSR.deviceConnected() = _DeviceConnected;
}
