import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  bool isLoading = false;
  bool isLoggedIn = false;
  String errorMessage = '';
  final String apiUrlLogin =
      'https://pet-adopt-dq32j.ondigitalocean.app/user/login';

  String? _token;
  String? _userId; 
  String? get token => _token;
  String? get userId => _userId;
    Map<String, dynamic>? userDetails; 


  // Função de login que retorna token e userId
  Future<Map<String, String>?> signIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password must not be empty');
    }

    try {
      isLoading = true;
      notifyListeners();

      final response = await http.post(
        Uri.parse(apiUrlLogin),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      print("Resposta bruta da API: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['token'] != null && data['userId'] != null) {
          _token = data['token'];
          _userId = data['userId'];
          await _storeCredentials(_token!, _userId!);

          print("Token recebido: $_token, UserId recebido: $_userId");
          return {'token': _token!, 'userId': _userId!}; 
        } else {
          errorMessage = data['message'] ?? 'Erro desconhecido';
          print("Mensagem de erro: $errorMessage");
          return null;
        }
      } else {
        errorMessage = 'Falha no login: ${response.statusCode}';
        print("Erro HTTP: $errorMessage");
        return null;
      }
    } catch (e) {
      errorMessage = 'Erro de rede: ${e.toString()}';
      print("Erro ao tentar login: $errorMessage");
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Função para armazenar token e userId no SharedPreferences
  Future<void> _storeCredentials(String token, String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token); 
      await prefs.setString('userId', userId);
      notifyListeners();
    } catch (e) {
      errorMessage = 'Failed to store credentials: $e';
      notifyListeners();
    }
  }

  // Função para carregar token e userId do SharedPreferences
  Future<void> loadCredentials() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString('token');
      _userId = prefs.getString('userId');
      isLoggedIn = _token != null && _userId != null;
      notifyListeners();
    } catch (e) {
      errorMessage = 'Failed to load credentials: $e';
      notifyListeners();
    }
  }

  // Função para limpar token e userId
  Future<void> clearCredentials() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove('userId');
      _token = null;
      _userId = null;
      isLoggedIn = false;
      notifyListeners();
    } catch (e) {
      errorMessage = 'Failed to clear credentials: $e';
      notifyListeners();
    }
  }

  Future<void> fetchUserDetails(String userId) async {
    final String apiUrl = 'https://pet-adopt-dq32j.ondigitalocean.app/user/$userId';
    try {
      isLoading = true;
      errorMessage = '';
      notifyListeners();

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        userDetails = data;
        print("Detalhes do usuário: $userDetails");
      } else {
        errorMessage = 'Erro ao buscar detalhes do usuário: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'Erro de rede: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
