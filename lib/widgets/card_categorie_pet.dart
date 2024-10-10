import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/models/Pet_Categorie_model.dart';

class CardCategoriePet extends StatelessWidget {
  final PetCategorieModel categorie;
  const CardCategoriePet({super.key, required this.categorie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 114,
      height: 109,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.0),
        color: Color(0xFFEBF0F0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                categorie.Icon,
                width: 26,
                height: 26,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            categorie.nomeCategorie,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}