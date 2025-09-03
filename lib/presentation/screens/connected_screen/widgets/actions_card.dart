import 'package:flutter/material.dart';

class ActionsCard extends StatelessWidget {
  final VoidCallback onRefreshData;
  final VoidCallback onSendRandomCommand;
  final VoidCallback onUpdateRandomStatus;

  const ActionsCard({
    super.key,
    required this.onRefreshData,
    required this.onSendRandomCommand,
    required this.onUpdateRandomStatus,
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
              'Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                ElevatedButton(
                  onPressed: onRefreshData,
                  child: const Text('Refresh Data'),
                ),
                ElevatedButton(
                  onPressed: onSendRandomCommand,
                  child: const Text('Send Random Command'),
                ),
                ElevatedButton(
                  onPressed: onUpdateRandomStatus,
                  child: const Text('Update Status'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}