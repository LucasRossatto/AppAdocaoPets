import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/http/http_client.dart';
import 'package:flutter_adocaopets/repositories/pet_repositoriy.dart';
import 'package:flutter_adocaopets/stores/pet_store.dart';
import 'package:flutter_adocaopets/view/Create_Pet1.dart';
import 'package:flutter_adocaopets/view/Home.screen.dart';
import 'package:flutter_adocaopets/view/Pet_Profile.dart';
import 'package:flutter_adocaopets/view/Profile_screen.dart';
import 'package:flutter_adocaopets/widgets/card_horizontal_pet.dart';
import 'package:flutter_adocaopets/widgets/search.input.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Mypets extends StatefulWidget {
  Mypets({super.key});

  @override
  State<Mypets> createState() => _MypetsState();
}

class _MypetsState extends State<Mypets> {
  final PetStore store = PetStore(
    repository: PetRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    store.getPets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Title_and_CreatePetBtn_container(),
          Search_input(),
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
                      style: TextStyle(
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
                      crossAxisCount: 1,
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
                            child: CardHorizontalPet(pet: item));
                      },
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomApp(),
    );
  }
}

class BottomApp extends StatelessWidget {
  const BottomApp({
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(token: '',),
                  ),
                );
              },
              icon: Image.asset(
                'assets/icons/Home.png',
                width: 24,
                height: 24,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/Paw.png',
                width: 24,
                height: 24,
                color: Color(0xFF5250E1),
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
                    builder: (context) => Profile_Screen(),
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
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "My pet’s memorial",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0xFF5250E1),
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Create_pet1(),
                      ),
                    );
                  },
                  icon: Icon(Icons.add),
                  color: Colors.white))
        ],
      ),
    );
  }
}
