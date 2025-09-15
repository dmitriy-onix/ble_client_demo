import 'package:ble_client_demo/arch/domain/failure/failure.dart';

class BleConnectedFailure implements Failure {
  final String message;

  BleConnectedFailure({required this.message});
}

class BleReadCharacteristicFailure extends BleConnectedFailure {
  BleReadCharacteristicFailure() : super(message: 'Failed to read characteristic');

  @override
  String toString() {
    return 'BleReadCharacteristicFailure';
  }
}

class BleWriteCharacteristicFailure extends BleConnectedFailure {
  BleWriteCharacteristicFailure() : super(message: 'Failed to write characteristic');

  @override
  String toString() {
    return 'BleWriteCharacteristicFailure';
  }
}

class BleDeviceDisconnectedFailure extends BleConnectedFailure {
  BleDeviceDisconnectedFailure() : super(message: 'Device disconnected unexpectedly');

  @override
  String toString() {
    return 'BleDeviceDisconnectedFailure';
  }
}

class BleServiceDiscoveryFailure extends BleConnectedFailure {
  BleServiceDiscoveryFailure() : super(message: 'Failed to discover services');

  @override
  String toString() {
    return 'BleServiceDiscoveryFailure';
  }
}