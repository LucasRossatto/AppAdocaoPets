import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // Importando shared_preferences

class AuthController extends ChangeNotifier {
  bool isLoading = false;
  bool isLoggedIn = false;
  String errorMessage = '';
  final String apiUrlLogin =
      'https://pet-adopt-dq32j.ondigitalocean.app/user/login';

  String? _token;
  String? get token => _token;

  // Função de login que retorna o token
  Future<String?> signIn(String email, String password) async {
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

      print(
          "Resposta bruta da API: ${response.body}"); // Log para verificar a resposta

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['token'] != null) {
          _token = data['token'];
          await _storeToken(_token!);

          print("Token recebido: $_token"); // Log do token recebido
          return _token; // Retorna o token
        } else {
          errorMessage = data['message'] ?? 'Erro desconhecido';
          print("Mensagem de erro: $errorMessage"); // Log do erro
          return null;
        }
      } else {
        errorMessage = 'Falha no login: ${response.statusCode}';
        print("Erro HTTP: $errorMessage"); // Log do erro HTTP
        return null;
      }
    } catch (e) {
      errorMessage = 'Erro de rede: ${e.toString()}';
      print("Erro ao tentar login: $errorMessage"); // Log do erro
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Função para armazenar o token no SharedPreferences
  Future<void> _storeToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token); // Usando a chave 'token'
      notifyListeners(); // Notifica que o token foi armazenado
    } catch (e) {
      errorMessage =
          'Failed to store token: $e'; // Tratar erro no armazenamento
      notifyListeners();
    }
  }

  // Função para carregar o token do SharedPreferences
  Future<void> loadToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString('token'); // Usando a mesma chave 'token'
      if (_token != null) {
        isLoggedIn = true;
      } else {
        isLoggedIn = false; // Token não encontrado
      }
      notifyListeners();
    } catch (e) {
      errorMessage =
          'Failed to load token: $e'; // Tratar erro ao carregar token
      notifyListeners();
    }
  }

  // Função para limpar o token
  Future<void> clearToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token'); // Remove a chave 'token'
      _token = null;
      isLoggedIn = false;
      notifyListeners();
    } catch (e) {
      errorMessage = 'Failed to clear token: $e'; // Tratar erro ao limpar token
      notifyListeners();
    }
  }
}
