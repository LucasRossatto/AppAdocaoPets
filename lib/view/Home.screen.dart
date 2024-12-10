import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/controllers/auth_controller.dart';
import 'package:flutter_adocaopets/controllers/feed_pet_controller.dart';
import 'package:flutter_adocaopets/view/MyPets.dart';
import 'package:flutter_adocaopets/view/Pet_Profile.dart';
import 'package:flutter_adocaopets/view/Profile_screen.dart';
import 'package:flutter_adocaopets/widgets/card_pet.dart';
import 'package:flutter_adocaopets/widgets/search.input.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_adocaopets/constants/images_assets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final String token;
  final String userId;

  const HomeScreen({required this.token, required this.userId, super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final FeedPetController controller;

  @override
  void initState() {
    super.initState();
    controller = Provider.of<FeedPetController>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getUserPets(widget.token).catchError((error) {
        _showErrorSnackBar("Erro ao carregar pets: $error");
      });

      Provider.of<AuthController>(context, listen: false)
          .fetchUserDetails(widget.userId, widget.token)
          .catchError((error) {
        _showErrorSnackBar(
            "Erro ao carregar as informações do usuário: $error");
      });
    });
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Profle_Container_Row(),
          const Search_input(),
          const Memorial_and_filter(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PetEmDestaque(),
          ),
          Expanded(
            child: FeedPets(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBarHome(
        token: widget.token,
        userId: widget.userId,
      ),
    );
  }

  Widget PetEmDestaque() {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        if (controller.pets.isEmpty) return const SizedBox();

        final firstPet = controller.pets.first;
        return GestureDetector(
          onTap: () {
            navPetProfile(firstPet);
          },
          child: Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: firstPet.images.isNotEmpty
                    ? NetworkImage(firstPet.images[0])
                    : const AssetImage('assets/default_image.png')
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
                      const Icon(Icons.favorite, color: Color(0xFFFC7171)),
                      Text(
                        "${firstPet.age} anos",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    firstPet.name ?? "Nome desconhecido",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget FeedPets() {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              controller.errorMessage,
              style: const TextStyle(
                color: Colors.black12,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        final pets = controller.pets;
        if (pets.isEmpty) {
          return const Center(
            child: Text(
              "Nenhum item na lista",
              style: TextStyle(
                color: Colors.black12,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            itemCount: pets.length - 1,
            itemBuilder: (context, index) {
              final pet = pets[index + 1];

              // Alterna entre dois tamanhos de altura
              final cardHeight = (index % 2 == 0) ? 270.0 : 182.0;

              return GestureDetector(
                onTap: () {
                  navPetProfile(pet);
                },
                child: SizedBox(
                  height: cardHeight,
                  child: CardPet(pet: pet),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void navPetProfile(pet) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Pet_profile(
          pet: pet,
          token: widget.token,
          userId: widget.userId,
        ),
      ),
    );
  }
}

class BottomAppBarHome extends StatelessWidget {
  final String token;
  final String userId;

  const BottomAppBarHome({
    super.key,
    required this.token,
    required this.userId,
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
              onPressed: () {},
              icon: Image.asset('assets/icons/Home.png', width: 24, height: 24),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Mypets(token: token, userId: userId),
                  ),
                );
              },
              icon: Image.asset('assets/icons/Paw.png', width: 24, height: 24),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/Message.png',
                  width: 24, height: 24),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>
                        Profile_Screen(token: token, userId: userId),
                  ),
                );
              },
              icon:
                  Image.asset('assets/icons/Person.png', width: 24, height: 24),
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
      child: const Padding(
        padding: EdgeInsets.all(16.0),
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

// ignore: camel_case_types
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
      child: const Padding(
        padding: EdgeInsets.all(16.0),
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

// ignore: camel_case_types
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
          const Text(
            "Feed",
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

// ignore: camel_case_types
class Profle_Container_Row extends StatelessWidget {
  const Profle_Container_Row({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

    // Acessando o nome corretamente
    final userName =
        authController.userDetails?['user']?['name'] ?? 'Usuário não logado';

    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: SizedBox(
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
                      width: 48.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(appImages.DogProfile),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Olá, ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "$userName",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Adote e compartilhe pets",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(
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
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: 380,
        height: 220,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(appImages.Cat),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(26)),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
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
