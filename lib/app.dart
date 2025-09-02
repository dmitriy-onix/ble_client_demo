import 'package:flutter/material.dart';

import 'core/app_routes.dart';
import 'presentation/screens/ble_scan_screen.dart';
import 'presentation/screens/ble_connected_screen.dart';

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
      initialRoute: AppRoutes.scan,
      routes: {
        AppRoutes.scan: (context) => const BleScanScreen(),
        AppRoutes.connected: (context) => const BleConnectedScreen(),
      },
    );
  }
}