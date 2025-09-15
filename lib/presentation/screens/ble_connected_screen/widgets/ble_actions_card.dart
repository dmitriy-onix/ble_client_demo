import 'package:ble_client_demo/presentation/screens/ble_connected_screen/bloc/ble_connected_screen_bloc.dart';
import 'package:ble_client_demo/presentation/screens/ble_connected_screen/bloc/ble_connected_screen_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BleActionsCard extends StatelessWidget {
  const BleActionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<BleConnectedScreenBloc>().add(
                        const BleConnectedScreenEvent.sendRandomCommand(),
                      );
                    },
                    child: const Text('Send Command'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<BleConnectedScreenBloc>().add(
                        const BleConnectedScreenEvent.readDeviceInfo(),
                      );
                    },
                    child: const Text('Read Info'),
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