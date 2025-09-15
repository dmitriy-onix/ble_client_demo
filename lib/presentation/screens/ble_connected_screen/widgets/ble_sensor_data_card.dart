import 'package:ble_client_demo/models/ble_device_data.dart';
import 'package:flutter/material.dart';

class BleSensorDataCard extends StatelessWidget {
  final BleDeviceData deviceData;

  const BleSensorDataCard({
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
              'Sensor Data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Temperature: ${deviceData.temperatureDisplay}'),
            Text('Humidity: ${deviceData.humidityDisplay}'),
            Text('Battery: ${deviceData.batteryDisplay}'),
          ],
        ),
      ),
    );
  }
}