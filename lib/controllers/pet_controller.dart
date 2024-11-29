import 'package:flutter_adocaopets/stores/pet_store.dart';

class PetController {
  final PetStore petStore;

  PetController({required this.petStore});

  Future<void> fetchPets() async {
    try {
      petStore.isLoading.value = true;
      await petStore.getPets();
    } catch (e) {
      petStore.erro.value = e.toString();
    } finally {
      petStore.isLoading.value = false;
    }
  }
}
