import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  // Change this to your Django server URL
  final String baseUrl = 'http://192.168.100.6:8000';  // For Android emulator
  // final String baseUrl = 'http://localhost:8000';  // For iOS simulator
  // final String baseUrl = 'https://hillarymutai.pythonanywhere.com';  // Hosted backend
  
  final storage = const FlutterSecureStorage();

  // Authentication headers
  Future<Map<String, String>> getHeaders() async {
    final token = await storage.read(key: 'token');
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Token $token',
    };
  }

  // Login
  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/token/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await storage.write(key: 'token', value: data['token']);
      await storage.write(key: 'user', value: jsonEncode(data['user']));
      return data;
    } else {
      throw Exception(jsonDecode(response.body)['error'] ?? 'Login failed');
    }
  }

  // Register
  Future<Map<String, dynamic>> register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/user/register/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
        'password2': password,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      await storage.write(key: 'token', value: data['token']);
      await storage.write(key: 'user', value: jsonEncode(data['user']));
      return data;
    } else {
      throw Exception(response.body);
    }
  }

  // Logout
  Future<void> logout() async {
    final token = await storage.read(key: 'token');
    if (token != null) {
      try {
        await http.post(
          Uri.parse('$baseUrl/logout/'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Token $token',
          },
        );
      } catch (e) {
        print('Error during logout: $e');
      }
    }
    await storage.deleteAll();
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final token = await storage.read(key: 'token');
    return token != null;
  }

  // Get user data
  Future<Map<String, dynamic>?> getUserData() async {
    final userJson = await storage.read(key: 'user');
    if (userJson != null) {
      return jsonDecode(userJson);
    }
    return null;
  }

  // Fetch user profile
  Future<Map<String, dynamic>> getUserProfile() async {
    final headers = await getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/user/'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user profile');
    }
  }

  // Update user profile
  Future<Map<String, dynamic>> updateUserProfile(Map<String, dynamic> data) async {
    final headers = await getHeaders();
    final response = await http.put(
      Uri.parse('$baseUrl/user/'),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final updatedData = jsonDecode(response.body);
      await storage.write(key: 'user', value: jsonEncode(updatedData));
      return updatedData;
    } else {
      throw Exception('Failed to update profile');
    }
  }
}
