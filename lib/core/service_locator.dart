import 'package:get_it/get_it.dart';

import '../services/ble_service.dart';
import '../services/reactive_bluetooth_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingleton<BleService>(BleService());
  getIt.registerSingleton<ReactiveBluetoothService>(ReactiveBluetoothService());
}
