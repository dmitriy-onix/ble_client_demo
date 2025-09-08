import 'package:ble_client_demo/models/ble_device_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connected_screen_models.freezed.dart';

@freezed
class ConnectedScreenEvent with _$ConnectedScreenEvent {
  const factory ConnectedScreenEvent.init() = InitEvent;

  const factory ConnectedScreenEvent.updateDeviceData(
    BleDeviceData deviceData,
  ) = UpdateDeviceDataEvent;

  const factory ConnectedScreenEvent.readDeviceInfo() = ReadDeviceInfoEvent;

  const factory ConnectedScreenEvent.toggleLed() = ToggleLedEvent;

  const factory ConnectedScreenEvent.sendRandomCommand() =
      SendRandomCommandEvent;

  const factory ConnectedScreenEvent.updateRandomStatus() =
      UpdateRandomStatusEvent;

  const factory ConnectedScreenEvent.disconnect() = DisconnectEvent;

  const factory ConnectedScreenEvent.createBond() = CreateBondEvent;

  const factory ConnectedScreenEvent.removeBond() = RemoveBondEvent;
}

@freezed
abstract class ConnectedScreenState with _$ConnectedScreenState {
  const factory ConnectedScreenState({required BleDeviceData deviceData}) =
      _ConnectedScreenState;
}

@freezed
class ConnectedScreenSR with _$ConnectedScreenSR {
  const factory ConnectedScreenSR.disconnected() = _Disconnected;

  const factory ConnectedScreenSR.commandSent(String command) = _CommandSent;

  const factory ConnectedScreenSR.bondingSuccess() = _BondingSuccess;

  const factory ConnectedScreenSR.removeBond() = _RemoveBondSuccess;
}
