import 'dart:convert';
import 'package:http/http.dart' as http;
import 'storage_service.dart';

class ApiService {
  // Android emulator uses 10.0.2.2 to access your computer's localhost.
  // If you use a real phone, replace this with your computer's LAN IP.
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  final StorageService _storageService = StorageService();

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/mobile/login'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      await _storageService.saveToken(data['token']);
      return data;
    }

    throw Exception(data['message'] ?? 'Login failed.');
  }

  Future<Map<String, dynamic>> checkInTicket(String ticketCodeOrUrl) async {
    final token = await _storageService.getToken();

    if (token == null) {
      throw Exception('You are not logged in.');
    }

    final response = await http.post(
      Uri.parse('$baseUrl/tickets/check-in'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'ticket_code': ticketCodeOrUrl,
      }),
    );

    final data = jsonDecode(response.body);

    return {
      'statusCode': response.statusCode,
      ...data,
    };
  }

  Future<void> logout() async {
    final token = await _storageService.getToken();

    if (token != null) {
      await http.post(
        Uri.parse('$baseUrl/mobile/logout'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
    }

    await _storageService.clearToken();
  }
}