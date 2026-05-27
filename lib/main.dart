import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'services/storage_service.dart';
import 'theme/machenji_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const EhostScannerApp());
}

class EhostScannerApp extends StatelessWidget {
  const EhostScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Machenji Scanner',
      debugShowCheckedModeBanner: false,
      theme: MachenjiTheme.light,
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  final StorageService _storageService = StorageService();

  bool _loading = true;
  bool _loggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    try {
      final token = await _storageService.getToken();

      if (!mounted) return;

      setState(() {
        _loggedIn = token != null && token.isNotEmpty;
        _loading = false;
      });
    } catch (error) {
      debugPrint('AuthGate token check failed: $error');

      if (!mounted) return;

      setState(() {
        _loggedIn = false;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return _loggedIn ? const HomeScreen() : const LoginScreen();
  }
}