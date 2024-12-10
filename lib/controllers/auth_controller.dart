import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  // Variáveis de Estado
  bool isLoading = false;
  bool isLoggedIn = false;
  String errorMessage = '';

  // URLs da API
  final String apiUrlLogin =
      'https://pet-adopt-dq32j.ondigitalocean.app/user/login';

  // Dados do Usuário
  String? _token;
  String? _userId;
  Map<String, dynamic>? userDetails;

  // Getters
  String? get token => _token;
  String? get userId => _userId;

  // Função de Login
  Future<Map<String, String>?> signIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password must not be empty');
    }

    try {
      _setLoadingState(true);

      final response = await http.post(
        Uri.parse(apiUrlLogin),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['token'] != null && data['userId'] != null) {
          _token = data['token'];
          _userId = data['userId'];
          await _storeCredentials(_token!, _userId!);

          return {'token': _token!, 'userId': _userId!};
        } else {
          _setError(data['message'] ?? 'Erro desconhecido');
          return null;
        }
      } else {
        _setError('Falha no login: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      _setError('Erro de rede: $e');
      return null;
    } finally {
      _setLoadingState(false);
    }
  }

  // Função para Buscar Detalhes do Usuário
  Future<void> fetchUserDetails(String userId, String token) async {
    final String apiUrl =
        'https://pet-adopt-dq32j.ondigitalocean.app/user/$userId';

    try {
      _setLoadingState(true);

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        userDetails = json.decode(response.body);
      } else {
        _setError('Erro ao buscar detalhes do usuário: ${response.statusCode}');
      }
    } catch (e) {
      _setError('Erro de rede: $e');
    } finally {
      _setLoadingState(false);
    }
  }

  // Função para Carregar Credenciais do SharedPreferences
  Future<void> loadCredentials() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString('token');
      _userId = prefs.getString('userId');
      isLoggedIn = _token != null && _userId != null;
    } catch (e) {
      _setError('Failed to load credentials: $e');
    } finally {
      notifyListeners();
    }
  }

  // Função para Armazenar Credenciais no SharedPreferences
  Future<void> _storeCredentials(String token, String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      await prefs.setString('userId', userId);
    } catch (e) {
      _setError('Failed to store credentials: $e');
    }
  }

  // Função para Limpar Credenciais
  Future<void> clearCredentials() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove('userId');
      _token = null;
      _userId = null;
      isLoggedIn = false;
    } catch (e) {
      _setError('Failed to clear credentials: $e');
    } finally {
      notifyListeners();
    }
  }

  // Funções Auxiliares
  void _setLoadingState(bool state) {
    isLoading = state;
    notifyListeners();
  }

  void _setError(String message) {
    errorMessage = message;
    notifyListeners();
  }
}
