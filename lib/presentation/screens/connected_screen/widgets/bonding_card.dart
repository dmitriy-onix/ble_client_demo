import 'package:ble_client_demo/models/ble_device_data.dart';
import 'package:flutter/material.dart';

class BondingCard extends StatelessWidget {
  final BleDeviceData deviceData;
  final VoidCallback onCreateBond;
  final VoidCallback onRemoveBond;

  const BondingCard({
    super.key,
    required this.deviceData,
    required this.onCreateBond,
    required this.onRemoveBond,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  deviceData.isBonded ? Icons.verified_user : Icons.security,
                  color: deviceData.isBonded ? Colors.green : Colors.orange,
                ),
                const SizedBox(width: 8),
                Text(
                  'Security & Bonding',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bond Status:',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: deviceData.isBonded ? Colors.green : Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            deviceData.isBonded ? 'Bonded' : 'Not Bonded',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: deviceData.isBonded ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        deviceData.isBonded 
                          ? 'Control Service is accessible'
                          : 'Control Service requires bonding',
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!deviceData.isBonded)
                      ElevatedButton.icon(
                        onPressed: onCreateBond,
                        icon: const Icon(Icons.security, size: 18),
                        label: const Text('Pair & Bond'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    if (deviceData.isBonded) ...[
                      ElevatedButton.icon(
                        onPressed: onRemoveBond,
                        icon: const Icon(Icons.security_update_warning, size: 18),
                        label: const Text('Remove Bond'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
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