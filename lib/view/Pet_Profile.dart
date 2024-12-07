import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/constants/images_assets.dart';
import 'package:flutter_adocaopets/models/Pet_model.dart';
import 'package:flutter_adocaopets/view/Home.screen.dart';

class Pet_profile extends StatelessWidget {
  final PetModel pet;
  final String token;
  final String userId;
  const Pet_profile(
      {super.key,
      required this.pet,
      required this.token,
      required this.userId});

  @override
  Widget build(BuildContext context) {
    // Seleciona a primeira imagem da lista de imagens do pet ou uma imagem padrão
    final petImage =
        pet.images.isNotEmpty ? pet.images[0] : 'assets/default_image.png';

    // Validação da imagem para o fundo
    final petBackdroop =
        pet.images.length > 1 ? pet.images[1] : 'assets/default_image.png';

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header container
            Container(
              width: 428,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(petBackdroop),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(26)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              token: token,
                              userId: userId,
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back),
                      color: const Color(0xFF5250E1),
                      iconSize: 24,
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF5250E1),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          appImages.MessageIcon,
                          color: Colors.white,
                        ),
                        iconSize: 24,
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Pet details
            Container(
              child: Column(
                children: [
                  ClipOval(
                    child: Container(
                      width: 108.0,
                      height: 108.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              petImage), // Usando a primeira imagem ou imagem padrão
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    pet.name,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Color(0xFFFC7171),
                      ),
                      Text(
                        pet.color,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Btns(),
            // Pet information box
            //descriptionContainer(pet: pet),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(26)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Caracteristicas",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Idade:",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600])),
                              Text("Tamanho:",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600])),
                              Text("Cor:",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600])),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${pet.age.toString()} anos",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                Text("${pet.weight.toString()} cm",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                Text(pet.color,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class descriptionContainer extends StatelessWidget {
  const descriptionContainer({
    super.key,
    required this.pet,
  });

  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Container(
        width: 380,
        height: 203,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFF5BCF95),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              style: TextStyle(color: Colors.white, fontSize: 16),
              pet.name,
            ),
          ),
        ),
      ),
    );
  }
}

class Btns extends StatelessWidget {
  const Btns({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(162, 52),
              side: BorderSide(color: Color(0xFFFC7171)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(Icons.favorite, color: Color(0xFFFC7171)),
                ),
                Text("Love(1,162)",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))
              ],
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(182, 52),
              side: BorderSide(color: Color(0xFF5250E1)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(Icons.share, color: Color(0xFF5250E1)),
                ),
                Text("Share(1,162)",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))
              ],
            ),
          )
        ],
      ),
    );
  }
}
