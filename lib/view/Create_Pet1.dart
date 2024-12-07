import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/Mock/Pet_Categorie_Db.dart';
import 'package:flutter_adocaopets/view/Create_Pet2.dart';
import 'package:flutter_adocaopets/widgets/card_categorie_pet.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Create_pet1 extends StatefulWidget {
  final String token;

  const Create_pet1({required this.token, Key? key}) : super(key: key);

  @override
  State<Create_pet1> createState() => _Create_pet1State();
}

class _Create_pet1State extends State<Create_pet1> {
  int? selectedIndex;

  void onCardTap(int index) {
    setState(() {
      selectedIndex = selectedIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 23),
            child: Text(
              "Selecione o tipo de animal",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: MasonryGridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemCount: appPetCategorie.length,
                itemBuilder: (context, index) {
                  return CardCategoriePet(
                    categorie: appPetCategorie[index],
                    isSelected: selectedIndex == index,
                    onTap: () => onCardTap(index),
                  );
                },
              ),
            ),
          ),
          Next_btn(
            isButtonEnabled: selectedIndex != null,
            onNext: () {
              if (selectedIndex != null) {
                final selectedCategorie =
                    appPetCategorie[selectedIndex!].nomeCategorie; 
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Create_pet2(
                      nomeCategorie: selectedCategorie, 
                      token: widget.token,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class Next_btn extends StatelessWidget {
  final bool isButtonEnabled;
  final VoidCallback onNext;

  const Next_btn({
    super.key,
    required this.isButtonEnabled,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: isButtonEnabled ? onNext : null,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(145, 56),
              backgroundColor:
                  isButtonEnabled ? const Color(0xFF5250E1) : Colors.grey.shade400,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: const Text(
              'Próximo',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
