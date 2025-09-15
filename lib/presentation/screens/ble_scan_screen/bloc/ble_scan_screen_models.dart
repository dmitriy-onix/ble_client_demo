import 'package:ble_client_demo/models/ble_connection_state.dart';
import 'package:bluetooth_low_energy/bluetooth_low_energy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ble_scan_screen_models.freezed.dart';

@freezed
class BleScanScreenEvent with _$BleScanScreenEvent {
  const factory BleScanScreenEvent.init() = InitEvent;

  const factory BleScanScreenEvent.startScan() = StartScanEvent;

  const factory BleScanScreenEvent.stopScan() = StopScanEvent;

  const factory BleScanScreenEvent.connectDevice(Peripheral peripheral) =
      ConnectDeviceEvent;

  const factory BleScanScreenEvent.updateScanResults(List<DiscoveredEventArgs> results) =
      UpdateScanResultsEvent;
}

@freezed
abstract class BleScanScreenState with _$BleScanScreenState {
  const factory BleScanScreenState({
    required BleConnectionState connectionState,
    @Default([]) List<DiscoveredEventArgs> scanResults,
  }) = _BleScanScreenState;
}

@freezed
class BleScanScreenSR with _$BleScanScreenSR {
  const factory BleScanScreenSR.deviceConnected() = _DeviceConnected;
}