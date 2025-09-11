import 'package:ble_client_demo/models/ble_device_data.dart';
import 'package:flutter/material.dart';

class ReactiveDeviceInfoCard extends StatelessWidget {
  final BleDeviceData deviceData;

  const ReactiveDeviceInfoCard({
    super.key,
    required this.deviceData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Device Information (Reactive BLE)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Name: ${deviceData.deviceName ?? "Unknown"}'),
            Text('Firmware: ${deviceData.firmwareVersion ?? "Unknown"}'),
          ],
        ),
      ),
    );
  }
}