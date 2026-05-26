import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'login_screen.dart';
import 'scanner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    await ApiService().logout();

    if (!context.mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  void _openScanner(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ScannerScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Machenji Ticket Scanner'),
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.confirmation_number, size: 80),
                const SizedBox(height: 20),
                Text(
                  'Verify Tickets',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Scan a ticket QR code to confirm if it is valid and check it in.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () => _openScanner(context),
                    icon: const Icon(Icons.qr_code_scanner),
                    label: const Text('Scan Ticket'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}