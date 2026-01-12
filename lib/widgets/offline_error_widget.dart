import 'package:flutter/material.dart';

class OfflineErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const OfflineErrorWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cloud_off, size: 80, color: Colors.grey[600]),
            const SizedBox(height: 16),
            const Text(
              "You are offline",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Please check your internet connection and try again.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            OutlinedButton(onPressed: onRetry, child: const Text("Try Again")),
          ],
        ),
      ),
    );
  }
}
