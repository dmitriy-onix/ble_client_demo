import 'package:ble_client_demo/models/ble_device_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ble_connected_screen_models.freezed.dart';

@freezed
class BleConnectedScreenEvent with _$BleConnectedScreenEvent {
  const factory BleConnectedScreenEvent.init() = InitEvent;

  const factory BleConnectedScreenEvent.updateDeviceData(
    BleDeviceData deviceData,
  ) = UpdateDeviceDataEvent;

  const factory BleConnectedScreenEvent.readDeviceInfo() = ReadDeviceInfoEvent;

  const factory BleConnectedScreenEvent.toggleLed() = ToggleLedEvent;

  const factory BleConnectedScreenEvent.sendRandomCommand() =
      SendRandomCommandEvent;

  const factory BleConnectedScreenEvent.updateRandomStatus() =
      UpdateRandomStatusEvent;

  const factory BleConnectedScreenEvent.disconnect() = DisconnectEvent;
}

@freezed
abstract class BleConnectedScreenState with _$BleConnectedScreenState {
  const factory BleConnectedScreenState({required BleDeviceData deviceData}) =
      _BleConnectedScreenState;
}

@freezed
class BleConnectedScreenSR with _$BleConnectedScreenSR {
  const factory BleConnectedScreenSR.disconnected() = _Disconnected;

  const factory BleConnectedScreenSR.commandSent(String command) = _CommandSent;
}
