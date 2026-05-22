import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../services/api_service.dart';
import 'result_screen.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final ApiService _apiService = ApiService();
  final MobileScannerController _scannerController = MobileScannerController();

  bool _processing = false;

  Future<void> _handleScan(String rawValue) async {
    if (_processing) return;

    setState(() {
      _processing = true;
    });

    await _scannerController.stop();

    try {
      final result = await _apiService.checkInTicket(rawValue);

      if (!mounted) return;

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(result: result),
        ),
      );

      if (!mounted) return;

      setState(() {
        _processing = false;
      });

      await _scannerController.start();
    } catch (error) {
      if (!mounted) return;

      setState(() {
        _processing = false;
      });

      await _scannerController.start();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString().replaceFirst('Exception: ', '')),
        ),
      );
    }
  }

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Ticket'),
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: _scannerController,
            onDetect: (capture) {
              final barcode = capture.barcodes.firstOrNull;
              final rawValue = barcode?.rawValue;

              if (rawValue == null || rawValue.isEmpty) return;

              _handleScan(rawValue);
            },
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.black.withValues(alpha: 0.7),
              child: Text(
                _processing
                    ? 'Checking ticket...'
                    : 'Point the camera at the ticket QR code.',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}