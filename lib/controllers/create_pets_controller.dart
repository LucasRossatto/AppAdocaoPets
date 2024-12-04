import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/models/Pet_model.dart';
import 'package:http/http.dart' as http;

class CreatePetController extends ChangeNotifier { 

    final String apiUrlRegister =
      'https://pet-adopt-dq32j.ondigitalocean.app/pet/create';

  bool _isLoading = false;
  bool _isLoggedIn = false;
  String _errorMessage = '';
  PetModel? _pet;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  String get errorMessage => _errorMessage;
  PetModel? get pet => _pet;

  // Atualiza o estado do carregamento
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Atualiza o usuário e estado de login
  void _setPet(PetModel? user) {
    _pet = pet;
    _isLoggedIn = user != null;
    _errorMessage = ''; // Limpa mensagens de erro
    notifyListeners();
  }

  // Atualiza a mensagem de erro
  void _setError(String error) {
    _errorMessage = error;
    _setPet(null); // Remove o usuário atual em caso de erro
    notifyListeners();
  }

   Future<void> createPet({
    required String userId,
    required String name,
    required String color,
    required String age,
    required String weight,
    required List<String> images,

 
  }) async {
    

    _setLoading(true);
    try {
      final response = await http.post(
        Uri.parse(apiUrlRegister),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'userId': userId,
          'name': name,
          'color': color,
          'weight': weight,
          'age': age,
          'images': images,
        }),
      );

      if (response.statusCode == 200) {
        final petJson = jsonDecode(response.body);
        final pet = PetModel.fromJson(petJson);
        _setPet(pet);
      } else {
        final errorJson = jsonDecode(response.body);
        _setError(errorJson['message'] ?? 'Erro ao criar Pet.');
      }
    } catch (e) {
      _setError('Erro de conexão: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Função para limpar mensagens de erro
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }
}
