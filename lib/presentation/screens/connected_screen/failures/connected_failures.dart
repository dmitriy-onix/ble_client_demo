import 'package:ble_client_demo/arch/domain/failure/failure.dart';

class ConnectedFailure implements Failure {
  final String message;

  ConnectedFailure({required this.message});
}

class DeviceReadFailure extends ConnectedFailure {
  DeviceReadFailure() : super(message: 'Failed to read device data');

  @override
  String toString() {
    return 'DeviceReadFailure';
  }
}

class LedControlFailure extends ConnectedFailure {
  LedControlFailure() : super(message: 'Failed to control LED');

  @override
  String toString() {
    return 'LedControlFailure';
  }
}

class CommandSendFailure extends ConnectedFailure {
  CommandSendFailure() : super(message: 'Failed to send command');

  @override
  String toString() {
    return 'CommandSendFailure';
  }
}

class StatusUpdateFailure extends ConnectedFailure {
  StatusUpdateFailure() : super(message: 'Failed to update status');

  @override
  String toString() {
    return 'StatusUpdateFailure';
  }
}

class DisconnectFailure extends ConnectedFailure {
  DisconnectFailure() : super(message: 'Failed to disconnect device');

  @override
  String toString() {
    return 'DisconnectFailure';
  }
}