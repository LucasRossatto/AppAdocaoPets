import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/models/Pet_model.dart';
import 'package:http/http.dart' as http;

class CreatePetController extends ChangeNotifier {
  // Url utilizada
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

  // Atualiza o pet e estado de login
  void _setPet(PetModel? pet) {
    _pet = pet;
    _isLoggedIn = pet != null;
    _errorMessage = ''; // Limpa mensagens de erro
    notifyListeners();
  }

  // Atualiza a mensagem de erro
  void _setError(String error) {
    _errorMessage = error;
    _setPet(null);
    notifyListeners();
  }

  Future<void> createPet({
    required String token,
    required String name,
    required String color,
    required String age,
    required String weight,
    required List<String> images,
    required String category,
    required String breed,
    required String story,
    required String gender,
  }) async {
    _setLoading(true);

    try {
      // Realiza a requisição POST
      final response = await http.post(
        Uri.parse(apiUrlRegister),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Inclui token no header
        },
        body: jsonEncode({
          'name': name,
          'color': color,
          'weight': weight,
          'age': age,
          'images': images,
          'breed': breed,
          'gender': gender,
          'story': story,
          'category': category,
        }),
      );

      // Verifica o código da resposta
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Decodifica a resposta e cria o modelo
        final petJson = jsonDecode(response.body);
        final pet = PetModel.fromJson(petJson);
        _setPet(pet);
      } else {
        // Trata erros da API
        final errorJson = jsonDecode(response.body);
        _setError(errorJson['message'] ?? 'Erro ao criar Pet.');
      }
    } catch (e) {
      // Trata erros genéricos de conexão ou parsing
      _setError('Erro de conexão: $e');
    } finally {
      // Finaliza o estado de carregamento
      _setLoading(false);
    }
  }

  // Função para limpar mensagens de erro
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }
}
