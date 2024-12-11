import 'package:flutter_adocaopets/constants/images_assets.dart';
import 'package:flutter_adocaopets/models/Pet_Categorie_model.dart';

List<PetCategorieModel> appPetCategorie = [
  PetCategorieModel(Icon: appCategories.Dog, nomeCategorie: 'Cachorro', value: 'dog'),
  PetCategorieModel(Icon: appCategories.Cat, nomeCategorie: 'Gato', value: 'cat'),
  PetCategorieModel(Icon: appCategories.Rabbit, nomeCategorie: 'Coelho', value: 'rabbit'),
  //PetCategorieModel(Icon: appCategories.Rodent, nomeCategorie: 'Roedor'),
  PetCategorieModel(Icon: appCategories.Bird, nomeCategorie: 'Ave',value: 'bird'),
  //PetCategorieModel(Icon: appCategories.Duck, nomeCategorie: 'Pato'),
 // PetCategorieModel(Icon: appCategories.Horse, nomeCategorie: 'Cavalo'),
  PetCategorieModel(Icon: appCategories.Fishes, nomeCategorie: 'Peixe',value: 'fish'),
  PetCategorieModel(Icon: appCategories.Others, nomeCategorie: 'Outros',value: 'outher'),
];
