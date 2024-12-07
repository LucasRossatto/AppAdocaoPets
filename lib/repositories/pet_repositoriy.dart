import 'dart:convert';
import 'package:flutter_adocaopets/http/exceptions.dart';
import 'package:flutter_adocaopets/http/http_client.dart';
import 'package:flutter_adocaopets/models/Pet_model.dart';

abstract class IPetRepository {
  Future<List<PetModel>> getPets();
}

class PetRepository implements IPetRepository {
  final IhttpClient client;

  PetRepository({required this.client});

  @override
  Future<List<PetModel>> getPets() async {
    final response = await client.get(
      url: "https://pet-adopt-dq32j.ondigitalocean.app/pet/pets",
    );

    if (response.statusCode == 200) {
      final List<PetModel> pets = [];

      final body = jsonDecode(response.body);

      body['pets'].forEach((item) {
        final PetModel pet = PetModel.fromJson(item);
        pets.add(pet);
      });

      return pets;
    } else if (response.statusCode == 404) {
      throw NotFoundException('A URL informada não é válida');
    } else {
      throw Exception('Não foi possível carregar os pets');
    }

  }
}
