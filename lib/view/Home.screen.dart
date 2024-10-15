import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/Mock/Pets_Fake_Db.dart';
import 'package:flutter_adocaopets/view/MyPets.dart';
import 'package:flutter_adocaopets/view/Profile_screen.dart';
import 'package:flutter_adocaopets/widgets/card_pet.dart';
import 'package:flutter_adocaopets/widgets/search.input.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_adocaopets/constants/images_assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      bottomNavigationBar: BottomAppBarHome(),
    );
  }
}

class BottomAppBarHome extends StatelessWidget {
  const BottomAppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
              },
              icon:
                  Image.asset('assets/icons/Home.png', width: 24, height: 24),
            ),
            IconButton(
              onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  Mypets(),
                      ),
                    );
                  },
              icon:
                  Image.asset('assets/icons/Paw.png', width: 24, height: 24),
            ),
            IconButton(
              onPressed: () {
              },
              icon: Image.asset('assets/icons/Message.png',
                  width: 24, height: 24),
            ),
            IconButton(
              onPressed: () { Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Profile_Screen(),
                    ),
                  );
              },
              icon: Image.asset('assets/icons/Person.png',
                  width: 24, height: 24),
            ),
          ],
        ),
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
          ),
        ],
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
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10),
      child: Container(
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
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Container(
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
      ),
    );
  }
}
