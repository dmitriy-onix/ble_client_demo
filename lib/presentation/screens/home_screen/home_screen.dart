import 'package:ble_client_demo/core/app_routes.dart';
import 'package:flutter/material.dart';

import 'widgets/navigation_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLE Client Demo'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.bluetooth, size: 80, color: Colors.blue),
              const SizedBox(height: 32),
              const Text(
                'BLE Package Comparison',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Choose which BLE package implementation to test:',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              NavigationCard(
                title: 'Flutter Blue Plus',
                subtitle: 'Using flutter_blue_plus package',
                icon: Icons.bluetooth_connected,
                color: Colors.blue,
                onTap: () => Navigator.pushNamed(context, AppRoutes.scan),
              ),
              const SizedBox(height: 24),
              NavigationCard(
                title: 'Flutter Reactive BLE',
                subtitle: 'Using flutter_reactive_ble package',
                icon: Icons.bluetooth_audio,
                color: Colors.green,
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.reactiveScan),
              ),
              const SizedBox(height: 48),
              Text(
                'Both implementations provide the same functionality\nfor performance and feature comparison.',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
