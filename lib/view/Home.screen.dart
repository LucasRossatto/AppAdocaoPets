import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/controllers/auth_controller.dart';
import 'package:flutter_adocaopets/controllers/pet_controller.dart';
import 'package:flutter_adocaopets/http/http_client.dart';
import 'package:flutter_adocaopets/repositories/pet_repositoriy.dart';
import 'package:flutter_adocaopets/stores/pet_store.dart';
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
  final String userId; // Novo parâmetro

  const HomeScreen({required this.token, required this.userId, Key? key})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PetController _petController; // Declaração do controller
  final PetStore store = PetStore(
    repository: PetRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    _petController = PetController(petStore: store); // Instancia o controller
    _petController.fetchPets();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AuthController>(context, listen: false)
          .fetchUserDetails(widget.userId);
    });
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
          const Cat_Container(),
          Expanded(
            child: AnimatedBuilder(
              animation:
                  Listenable.merge([store.isLoading, store.erro, store.state]),
              builder: (context, child) {
                if (store.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (store.erro.value.isNotEmpty) {
                  return Center(
                    child: Text(
                      store.erro.value,
                      style: const TextStyle(
                        color: Colors.black12,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                if (store.state.value.isEmpty) {
                  return Center(
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
                } else {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      itemCount: store.state.value.length,
                      itemBuilder: (context, index) {
                        final item = store.state.value[index];
                        final petImage = item.images.isNotEmpty
                            ? item.images[0]
                            : 'assets/default_image.png'; // Imagem padrão

                        return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Pet_profile(
                                    pet: item,
                                  ),
                                ),
                              );
                            },
                            child: CardPet(pet: item));
                      },
                    ),
                  );
                }
              },
            ),
          )

          /*Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                itemCount: appPets.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Pet_profile(
                            pet: appPets[index],
                          ),
                        ),
                      );
                    },
                    child: CardPet(
                      pet: appPets[index],
                    ),
                  );
                },
              ),
            ),
          ),*/
        ],
      ),
      bottomNavigationBar: BottomAppBarHome(
        token: widget.token,
        userId: widget.userId,
      ),
    );
  }
}

class BottomAppBarHome extends StatelessWidget {
  final String token;
  final String userId;

  const BottomAppBarHome({
    Key? key,
    required this.token,
    required this.userId,
  }) : super(key: key);

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
                    builder: (context) => Mypets(),
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

class Profle_Container_Row extends StatelessWidget {
  const Profle_Container_Row({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

    // Acessando o nome corretamente
    final userName =
        authController.userDetails?['user']?['name'] ?? 'Nome indefinido';

    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
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
                          "Olá,",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          " $userName!",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "adote seus pets",
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
