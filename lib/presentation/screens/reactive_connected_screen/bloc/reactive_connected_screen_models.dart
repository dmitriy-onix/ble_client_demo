import 'package:ble_client_demo/models/ble_device_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reactive_connected_screen_models.freezed.dart';

@freezed
class ReactiveConnectedScreenEvent with _$ReactiveConnectedScreenEvent {
  const factory ReactiveConnectedScreenEvent.init() = InitEvent;

  const factory ReactiveConnectedScreenEvent.updateDeviceData(
    BleDeviceData deviceData,
  ) = UpdateDeviceDataEvent;

  const factory ReactiveConnectedScreenEvent.readDeviceInfo() = ReadDeviceInfoEvent;

  const factory ReactiveConnectedScreenEvent.toggleLed() = ToggleLedEvent;

  const factory ReactiveConnectedScreenEvent.sendRandomCommand() =
      SendRandomCommandEvent;

  const factory ReactiveConnectedScreenEvent.updateRandomStatus() =
      UpdateRandomStatusEvent;

  const factory ReactiveConnectedScreenEvent.disconnect() = DisconnectEvent;

}

@freezed
abstract class ReactiveConnectedScreenState with _$ReactiveConnectedScreenState {
  const factory ReactiveConnectedScreenState({required BleDeviceData deviceData}) =
      _ReactiveConnectedScreenState;
}

@freezed
class ReactiveConnectedScreenSR with _$ReactiveConnectedScreenSR {
  const factory ReactiveConnectedScreenSR.disconnected() = _Disconnected;

  const factory ReactiveConnectedScreenSR.commandSent(String command) = _CommandSent;

}