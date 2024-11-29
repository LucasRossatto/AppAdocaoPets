import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_adocaopets/models/User_model.dart';

class UserController with ChangeNotifier {
  final String apiUrlRegister =
      'https://pet-adopt-dq32j.ondigitalocean.app/user/register';

  bool _isLoading = false;
  bool _isLoggedIn = false;
  String _errorMessage = '';
  UserModel? _user;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  String get errorMessage => _errorMessage;
  UserModel? get user => _user;

  // Atualiza o estado do carregamento
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Atualiza o usuário e estado de login
  void _setUser(UserModel? user) {
    _user = user;
    _isLoggedIn = user != null;
    _errorMessage = ''; // Limpa mensagens de erro
    notifyListeners();
  }

  // Atualiza a mensagem de erro
  void _setError(String error) {
    _errorMessage = error;
    _setUser(null); // Remove o usuário atual em caso de erro
    notifyListeners();
  }

  // Função para criar uma conta
  Future<void> createAccount({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmpassword,
  }) async {
    if (password != confirmpassword) {
      _setError('As senhas não coincidem.');
      return;
    }

    _setLoading(true);
    try {
      final response = await http.post(
        Uri.parse(apiUrlRegister),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'confirmpassword': confirmpassword,
        }),
      );

      if (response.statusCode == 200) {
        final userJson = jsonDecode(response.body);
        final user = UserModel.fromJson(userJson);
        _setUser(user);
      } else {
        final errorJson = jsonDecode(response.body);
        _setError(errorJson['message'] ?? 'Erro ao criar conta.');
      }
    } catch (e) {
      _setError('Erro de conexão: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Função para logout
  void logout() {
    _setUser(null);
  }

  // Função para limpar mensagens de erro
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }
}
