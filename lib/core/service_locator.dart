import 'package:get_it/get_it.dart';

import '../services/ble_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingleton<BleService>(BleService());
}
