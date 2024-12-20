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
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
                image: pet.images.isNotEmpty
                    ? NetworkImage(pet.images[0])
                    : const AssetImage('assets/icons/default_image.png')
                        as ImageProvider,
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
                const Icon(
                  Icons.favorite,
                  color: Color(0xFFFC7171),
                  size: 24,
                ),
                Text(
                  // Cor do pet
                  "${pet.age.toString()} anos",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              // Nome do pet
              pet.name,
              style: const TextStyle(
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
