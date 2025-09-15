import 'package:ble_client_demo/arch/domain/failure/failure.dart';

class BleScanFailure implements Failure {
  final String message;

  BleScanFailure({required this.message});
}

class BleBluetoothNotSupportedFailure extends BleScanFailure {
  BleBluetoothNotSupportedFailure()
    : super(message: 'Bluetooth not supported on this device');

  @override
  String toString() {
    return 'BleBluetoothNotSupportedFailure';
  }
}

class BleBluetoothDisabledFailure extends BleScanFailure {
  BleBluetoothDisabledFailure() : super(message: 'Please enable Bluetooth');

  @override
  String toString() {
    return 'BleBluetoothDisabledFailure';
  }
}

class BleScanStartFailure extends BleScanFailure {
  BleScanStartFailure() : super(message: 'Failed to start scan');

  @override
  String toString() {
    return 'BleScanStartFailure';
  }
}

class BleDeviceConnectionFailure extends BleScanFailure {
  BleDeviceConnectionFailure() : super(message: 'Failed to connect to device');

  @override
  String toString() {
    return 'BleDeviceConnectionFailure';
  }
}