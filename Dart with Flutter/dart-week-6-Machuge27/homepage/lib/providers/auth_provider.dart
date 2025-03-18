import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoggedIn = false;
  bool _isLoading = false;
  Map<String, dynamic>? _userData;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  Map<String, dynamic>? get userData => _userData;

  AuthProvider() {
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    _isLoading = true;
    notifyListeners();

    try {
      _isLoggedIn = await _apiService.isLoggedIn();
      if (_isLoggedIn) {
        _userData = await _apiService.getUserData();
      }
    } catch (e) {
      _isLoggedIn = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _apiService.login(username, password);
      _userData = data['user'];
      _isLoggedIn = true;
      return true;
    } catch (e) {
      print('Login error: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> register(String username, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _apiService.register(username, email, password);
      _userData = data['user'];
      _isLoggedIn = true;
      return true;
    } catch (e) {
      print('Registration error: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _apiService.logout();
      _isLoggedIn = false;
      _userData = null;
    } catch (e) {
      print('Logout error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshUserData() async {
    try {
      _userData = await _apiService.getUserProfile();
      notifyListeners();
    } catch (e) {
      print('Error refreshing user data: $e');
    }
  }
}