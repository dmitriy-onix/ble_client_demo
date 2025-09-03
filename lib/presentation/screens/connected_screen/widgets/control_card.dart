import 'package:ble_client_demo/models/ble_device_data.dart';
import 'package:flutter/material.dart';

class ControlCard extends StatelessWidget {
  final BleDeviceData deviceData;
  final VoidCallback onToggleLed;

  const ControlCard({
    super.key,
    required this.deviceData,
    required this.onToggleLed,
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
              'Control',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('LED: '),
                Switch(
                  value: deviceData.ledState,
                  onChanged: (_) => onToggleLed(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(deviceData.status ?? "Unknown"),
          ],
        ),
      ),
    );
  }
}