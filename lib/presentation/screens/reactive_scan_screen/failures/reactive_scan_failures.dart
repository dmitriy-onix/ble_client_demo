import 'package:ble_client_demo/arch/domain/failure/failure.dart';

class ReactiveScanFailure implements Failure {
  final String message;

  ReactiveScanFailure({required this.message});
}

class ReactiveBluetoothNotSupportedFailure extends ReactiveScanFailure {
  ReactiveBluetoothNotSupportedFailure()
    : super(message: 'Bluetooth not supported on this device');

  @override
  String toString() {
    return 'ReactiveBluetoothNotSupportedFailure';
  }
}

class ReactiveBluetoothDisabledFailure extends ReactiveScanFailure {
  ReactiveBluetoothDisabledFailure() : super(message: 'Please enable Bluetooth');

  @override
  String toString() {
    return 'ReactiveBluetoothDisabledFailure';
  }
}

class ReactiveScanStartFailure extends ReactiveScanFailure {
  ReactiveScanStartFailure() : super(message: 'Failed to start scan');

  @override
  String toString() {
    return 'ReactiveScanStartFailure';
  }
}

class ReactiveDeviceConnectionFailure extends ReactiveScanFailure {
  ReactiveDeviceConnectionFailure() : super(message: 'Failed to connect to device');

  @override
  String toString() {
    return 'ReactiveDeviceConnectionFailure';
  }
}