import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/constants/images_assets.dart';
import 'package:flutter_adocaopets/models/Pet_model.dart';
import 'package:flutter_adocaopets/view/Home.screen.dart';

class Pet_profile extends StatelessWidget {
  final PetModel pet;
  const Pet_profile({
    super.key,
    required this.pet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Backdroop_Container(),
            Container(
              child: Column(
                children: [
                  ClipOval(
                    child: Container(
                      width: 108.0,
                      height: 108.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(pet.image), // Imagem asset
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
                        pet.city,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Btns(),
            Description(),
            Sub_desc_btns(),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(26)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Information",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26),
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name:",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600]),
                                ),
                                Text(
                                  "Born:",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600]),
                                ),
                                Text(
                                  "Gender:",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600]),
                                ),
                                Text(
                                  "Breed:",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600]),
                                ),
                                Text(
                                  "Favourite toy:",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600]),
                                ),
                                Text(
                                  "Habits:",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600]),
                                ),
                                Text(
                                  "Characteristics:",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600]),
                                ),
                                Text(
                                  "Favourite food",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pet.name,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    pet.born,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    pet.breed,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    pet.favourite_toy,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    pet.habits,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    pet.characteristics,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    pet.favourite_food,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
            Life_Events_container()
          ],
        ),
      ),
    );
  }
}

class Backdroop_Container extends StatelessWidget {
  const Backdroop_Container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 428,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(appImages.NotFound),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(26)),
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
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              icon: Icon(Icons.arrow_back),
              color: const Color.fromARGB(255, 255, 255, 255),
              
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
    );
  }
}

class Life_Events_container extends StatelessWidget {
  const Life_Events_container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(26)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Life Events",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "2022:",
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                        Text(
                          "2020:",
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                        Text(
                          "2018:",
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                        Text(
                          "2016:",
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Lived in New York",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Toilet trained",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Was welcomed home",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class Sub_desc_btns extends StatelessWidget {
  const Sub_desc_btns({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Color(0xFF5250E1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(
                    Icons.share,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                Text(
                  "Info",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Color(0xFFEBF0F0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(
                    Icons.video_library_outlined,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Text(
                  "Gallery",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Color(0xFFEBF0F0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(
                    Icons.comment_outlined,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Text(
                  "Gallery",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
          ),
        ],
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
              side: BorderSide(
                color: Color(0xFFFC7171),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    16), // Altere o valor para ajustar o arredondamento
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.favorite,
                    color: Color(0xFFFC7171),
                  ),
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
              side: BorderSide(
                color: Color(0xFF5250E1),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    16), // Altere o valor para ajustar o arredondamento
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.share,
                    color: Color(0xFF5250E1),
                  ),
                ),
                Text(
                  "Share(1,162)",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    super.key,
  });

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
              "There was never a patch of sun that Ginger wasn’t to be found sleeping in! I’ve never known such a lazy yet loving cat.6 incredible years we shared together, you knew me better than I knew myself. Thank you for all the endless love. Miss you already.",
            ),
          ),
        ),
      ),
    );
  }
}
