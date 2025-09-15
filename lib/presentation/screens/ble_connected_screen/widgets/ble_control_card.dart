import 'package:ble_client_demo/models/ble_device_data.dart';
import 'package:ble_client_demo/presentation/screens/ble_connected_screen/bloc/ble_connected_screen_bloc.dart';
import 'package:ble_client_demo/presentation/screens/ble_connected_screen/bloc/ble_connected_screen_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BleControlCard extends StatelessWidget {
  final BleDeviceData deviceData;

  const BleControlCard({
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
              'Device Control',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Status: ${deviceData.status ?? "Unknown"}'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<BleConnectedScreenBloc>().add(
                        const BleConnectedScreenEvent.toggleLed(),
                      );
                    },
                    child: const Text('Toggle LED'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<BleConnectedScreenBloc>().add(
                        const BleConnectedScreenEvent.updateRandomStatus(),
                      );
                    },
                    child: const Text('Update Status'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}