import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/constants/images_assets.dart';
import 'package:flutter_adocaopets/models/Pet_model.dart';

class CardHorizontalPet extends StatelessWidget {
  final PetModel pet;
  const CardHorizontalPet({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 220,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(pet.imagem),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    pet.nome,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFF5250E1),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove_red_eye),
                      color: Colors.white,
                      iconSize: 16,
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 2,left: 6),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                      color: Colors.white,
                      iconSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
