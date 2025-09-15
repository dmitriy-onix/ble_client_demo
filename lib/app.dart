import 'package:flutter/material.dart';

import 'core/app_routes.dart';
import 'presentation/screens/ble_connected_screen/ble_connected_screen.dart' as ble_low_energy;
import 'presentation/screens/ble_scan_screen/ble_scan_screen.dart' as ble_low_energy;
import 'presentation/screens/connected_screen/ble_connected_screen.dart' as flutter_blue_plus;
import 'presentation/screens/home_screen/home_screen.dart';
import 'presentation/screens/reactive_connected_screen/reactive_ble_connected_screen.dart';
import 'presentation/screens/reactive_scan_screen/reactive_ble_scan_screen.dart';
import 'presentation/screens/scan_screen/ble_scan_screen.dart' as flutter_blue_plus;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLE Client Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.scan: (context) => const flutter_blue_plus.BleScanScreen(),
        AppRoutes.connected: (context) => const flutter_blue_plus.BleConnectedScreen(),
        AppRoutes.reactiveScan: (context) => const ReactiveBleScanScreen(),
        AppRoutes.reactiveConnected: (context) =>
            const ReactiveConnectedScreen(),
        AppRoutes.bleScan: (context) => const ble_low_energy.BleScanScreen(),
        AppRoutes.bleConnected: (context) => const ble_low_energy.BleConnectedScreen(),
      },
    );
  }
}
