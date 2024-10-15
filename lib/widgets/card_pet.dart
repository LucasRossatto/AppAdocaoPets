import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/models/Pet_model.dart';

class CardPet extends StatelessWidget {
  final PetModel pet;
  const CardPet({
    super.key,
    required this.pet
    });

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 182,
      height: 270,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(pet.imagem), // Imagem asset
            fit: BoxFit.cover, // Como a imagem deve se ajustar
          ),
          borderRadius: BorderRadius.circular(26)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: Color(0xFFFC7171),
                  size: 24,
                ),
                Text(
                  pet.likes,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              pet.nome,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}