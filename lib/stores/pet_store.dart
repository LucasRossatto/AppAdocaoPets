import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/http/exceptions.dart';
import 'package:flutter_adocaopets/models/Pet_model.dart';
import 'package:flutter_adocaopets/repositories/pet_repositoriy.dart';

class PetStore {
  final IPetRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<PetModel>> state = ValueNotifier<List<PetModel>>([]);

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  PetStore({required this.repository});

   Future getPets() async {
    isLoading.value = true;

    try {
      final result = await repository.getPets();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
      
    }
    isLoading.value = false;
  }
}
