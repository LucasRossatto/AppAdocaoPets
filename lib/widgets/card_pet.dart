import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/models/Pet_model.dart';

class CardPet extends StatelessWidget {
  final PetModel pet;

  const CardPet({
    super.key,
    required this.pet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 182,
      height: 250, // altura ajustada
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(pet.images.isNotEmpty ? pet.images[0] : 'default_image_url'), // Exibe a primeira imagem, ou uma imagem default
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(26),
      ),
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
                  pet.age.toString(), // Cor do pet
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " anos", // Cor do pet
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              pet.name, // Nome do pet
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
