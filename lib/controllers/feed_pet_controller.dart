import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/models/Pet_model.dart';

class FeedPetController with ChangeNotifier {
  final String apiUrl = 'https://pet-adopt-dq32j.ondigitalocean.app/pet/pets';
  bool isLoading = false;
  bool isLoggedIn = false;
  String errorMessage = '';
  String? _token;
  String? get token => _token;

  List<PetModel> pets = [];

Future<void> getUserPets(String token) async {
  if (token.isEmpty) {
    throw Exception('O token não pode estar vazio.');
  }

  isLoading = true;
  notifyListeners();

  try {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    // print para verificar o token e a resposta da API
    print("Resposta da API: ${response.statusCode}");
    print("Corpo da resposta: ${response.body}");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      if (body['pets'] != null) {
        pets = (body['pets'] as List)
            .map((item) => PetModel.fromJson(item))
            .toList();
      } else {
        pets = [];
      }
    } else if (response.statusCode == 422) {
      final errorBody = jsonDecode(response.body);
      throw Exception('Erro 422: ${errorBody['message'] ?? 'Token inválido ou outro erro'}');
    } else if (response.statusCode == 401) {
      throw Exception('Token inválido ou sessão expirada.');
    } else {
      throw Exception('Erro inesperado ao carregar os pets. Status: ${response.statusCode}');
    }
  } catch (e) {
    errorMessage = e.toString();
    rethrow; // Relança a exceção para tratamento adicional
  } finally {
    isLoading = false;
    notifyListeners();
  }
}

  // Método para limpar os dados de erro
  void clearError() {
    errorMessage = '';
    notifyListeners();
  }
}