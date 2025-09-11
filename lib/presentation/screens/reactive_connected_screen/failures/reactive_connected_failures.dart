import 'package:ble_client_demo/arch/domain/failure/failure.dart';

class ReactiveConnectedFailure implements Failure {
  final String message;

  ReactiveConnectedFailure({required this.message});
}

class ReactiveDeviceReadFailure extends ReactiveConnectedFailure {
  ReactiveDeviceReadFailure() : super(message: 'Failed to read device data');

  @override
  String toString() {
    return 'ReactiveDeviceReadFailure';
  }
}

class ReactiveLedControlFailure extends ReactiveConnectedFailure {
  ReactiveLedControlFailure() : super(message: 'Failed to control LED');

  @override
  String toString() {
    return 'ReactiveLedControlFailure';
  }
}

class ReactiveCommandSendFailure extends ReactiveConnectedFailure {
  ReactiveCommandSendFailure() : super(message: 'Failed to send command');

  @override
  String toString() {
    return 'ReactiveCommandSendFailure';
  }
}

class ReactiveStatusUpdateFailure extends ReactiveConnectedFailure {
  ReactiveStatusUpdateFailure() : super(message: 'Failed to update status');

  @override
  String toString() {
    return 'ReactiveStatusUpdateFailure';
  }
}

class ReactiveDisconnectFailure extends ReactiveConnectedFailure {
  ReactiveDisconnectFailure() : super(message: 'Failed to disconnect device');

  @override
  String toString() {
    return 'ReactiveDisconnectFailure';
  }
}

class ReactiveBondingFailure extends ReactiveConnectedFailure {
  ReactiveBondingFailure() : super(message: 'Failed to bond with device');

  @override
  String toString() {
    return 'ReactiveBondingFailure';
  }
}

class ReactiveBondRemovalFailure extends ReactiveConnectedFailure {
  ReactiveBondRemovalFailure() : super(message: 'Failed to remove bond');

  @override
  String toString() {
    return 'ReactiveBondRemovalFailure';
  }
}