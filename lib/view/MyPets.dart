import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/controllers/feed_user_pet_controller.dart';
import 'package:flutter_adocaopets/models/Pet_model.dart';
import 'package:flutter_adocaopets/view/Create_Pet1.dart';
import 'package:flutter_adocaopets/view/Home.screen.dart';
import 'package:flutter_adocaopets/view/Pet_Profile.dart';
import 'package:flutter_adocaopets/view/Profile_screen.dart';
import 'package:flutter_adocaopets/widgets/card_horizontal_pet.dart';
import 'package:flutter_adocaopets/widgets/search.input.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class Mypets extends StatefulWidget {
  final String token;
  final String userId;

  const Mypets({
    required this.token,
    required this.userId,
    super.key,
  });

  @override
  State<Mypets> createState() => _MypetsState();
}

class _MypetsState extends State<Mypets> {
  late FeedUserPetController controller;

  @override
  void initState() {
    super.initState();
    controller = Provider.of<FeedUserPetController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getUserPets(widget.token).catchError((error) {
        print("Erro ao carregar pets na tela: $error");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao carregar pets: $error")),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Title_and_CreatePetBtn_container(
            token: widget.token,
            userId: widget.userId,
          ),
          Search_input(),
          Expanded(
            child: Consumer<FeedUserPetController>(
              builder: (context, controller, child) {
                if (controller.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.errorMessage.isNotEmpty) {
                  return Center(
                    child: Text(
                      controller.errorMessage,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  );
                }

                if (controller.pets.isEmpty) {
                  return const Center(
                    child: Text(
                      "Nenhum pet encontrado",
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: MasonryGridView.count(
                      crossAxisCount: 1,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      itemCount: controller.pets.length,
                      itemBuilder: (context, index) {
                        final PetModel item = controller.pets[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Pet_profile(
                                  pet: item,
                                  token: widget.token,
                                  userId: widget.userId,
                                ),
                              ),
                            );
                          },
                          child: CardHorizontalPet(pet: item),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomApp(
        token: widget.token,
        userId: widget.userId,
      ),
    );
  }
}

class BottomApp extends StatelessWidget {
  final String token;
  final String userId;

  const BottomApp({
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
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>
                        HomeScreen(token: token, userId: userId),
                  ),
                );
              },
              icon: Image.asset(
                'assets/icons/HomeOutlined.png',
                width: 24,
                height: 24,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/PawFilled.png',
                width: 24,
                height: 24,
                color: const Color(0xFF5250E1),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/Message.png',
                  width: 24, height: 24),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Profile_Screen(
                      token: token,
                      userId: userId,
                    ),
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

class Title_and_CreatePetBtn_container extends StatelessWidget {
  const Title_and_CreatePetBtn_container({
    super.key,
    required this.token,
    required this.userId,
  });

  final String token;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20, right: 24, left: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Meus pets",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xFF5250E1),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Create_pet1(token: token, userId: userId,),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
