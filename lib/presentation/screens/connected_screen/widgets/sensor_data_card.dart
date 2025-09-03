import 'package:ble_client_demo/models/ble_device_data.dart';
import 'package:flutter/material.dart';

class SensorDataCard extends StatelessWidget {
  final BleDeviceData deviceData;

  const SensorDataCard({
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Icon(Icons.thermostat, size: 32),
                    Text(deviceData.temperatureDisplay),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.water_drop, size: 32),
                    Text(deviceData.humidityDisplay),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.battery_std, size: 32),
                    Text(deviceData.batteryDisplay),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}