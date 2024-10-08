import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/Mock/Pets_Fake_Db.dart';
import 'package:flutter_adocaopets/widgets/card_pet.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_adocaopets/constants/images_assets.dart';
import 'package:flutter_adocaopets/models/Pet_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Profle_Container_Row(),
          Search_input(),
          Memorial_and_filter(),
          Cat_Container(),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      itemCount: appPets.length,
                      itemBuilder: (context, index) {
                        return CardPet(
                          pet: appPets[index],
                        );
                      },
                    ),
             ),
           ),
        ],
      ),
    );
  }
}

class papagaio_container extends StatelessWidget {
  const papagaio_container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 182,
      height: 192,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(appImages.Papagaio), // Imagem asset
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
                  "1,268",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              "Ginger",
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

class Dog_Container extends StatelessWidget {
  const Dog_Container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 182,
      height: 270,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(appImages.DogHome), // Imagem asset
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
                  "1,268",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              "Ginger",
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

class Memorial_and_filter extends StatelessWidget {
  const Memorial_and_filter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 22, end: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Memorial",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/icons/Menu.png', width: 24, height: 24),
          )
        ],
      ),
    );
  }
}

class Search_input extends StatelessWidget {
  const Search_input({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 364,
        height: 60,
        child: TextField(
          decoration: InputDecoration(
              filled: true, // Habilita a cor de fundo
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0), // Raio da borda
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 255, 255, 255), // Cor da borda
                  width: 4.0, // Largura da borda
                ),
              ),
              label: Text(
                'Search for pets, name, location...',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              suffixIcon: Image.asset(
                appImages.SearchIcon,
                width: 22,
                height: 22,
              )),
        ),
      ),
    );
  }
}

class Profle_Container_Row extends StatelessWidget {
  const Profle_Container_Row({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipOval(
                  child: Container(
                    width: 48.0, // Largura do container
                    height: 48.0, // Altura do container
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(appImages.DogProfile), // Imagem asset
                        fit: BoxFit.cover, // Como a imagem deve se ajustar
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      child: Row(
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        " Daisy!",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
                  Text(
                    "Share your pet memorials",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
          Icon(
            Icons.notifications_rounded,
            size: 24,
          )
        ],
      ),
    );
  }
}

class Cat_Container extends StatelessWidget {
  const Cat_Container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 220,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(appImages.Cat), // Imagem asset
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
                  "1,268",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              "Ginger",
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
