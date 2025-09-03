import 'package:ble_client_demo/arch/domain/failure/failure.dart';

class ScanFailure implements Failure {
  final String message;

  ScanFailure({required this.message});
}

class BluetoothNotSupportedFailure extends ScanFailure {
  BluetoothNotSupportedFailure()
    : super(message: 'Bluetooth not supported on this device');

  @override
  String toString() {
    return 'BluetoothNotSupportedFailure';
  }
}

class BluetoothDisabledFailure extends ScanFailure {
  BluetoothDisabledFailure() : super(message: 'Please enable Bluetooth');

  @override
  String toString() {
    return 'BluetoothDisabledFailure';
  }
}

class ScanStartFailure extends ScanFailure {
  ScanStartFailure() : super(message: 'Failed to start scan');

  @override
  String toString() {
    return 'ScanStartFailure';
  }
}

class DeviceConnectionFailure extends ScanFailure {
  DeviceConnectionFailure() : super(message: 'Failed to connect to device');

  @override
  String toString() {
    return 'DeviceConnectionFailure';
  }
}
