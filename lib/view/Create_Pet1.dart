import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/Mock/Pet_Categorie_Db.dart';
import 'package:flutter_adocaopets/constants/images_assets.dart';
import 'package:flutter_adocaopets/view/Create_Pet2.dart';
import 'package:flutter_adocaopets/widgets/card_categorie_pet.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Create_pet1 extends StatefulWidget {
  const Create_pet1({super.key});

  @override
  State<Create_pet1> createState() => _Create_pet1State();
}

class _Create_pet1State extends State<Create_pet1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Text(
              "Select animal",
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
                  );
                },
              ),
            ),
          ),
          Next_btn()
        ],
      ),
    );
  }
}

class Next_btn extends StatelessWidget {
  const Next_btn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Create_pet2(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(145, 56),
              backgroundColor: Color(0xFF5250E1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Text(
              'Next',
              style: TextStyle(
                fontSize: 16, // Tamanho da fonte
                fontWeight: FontWeight.bold, // Negrito
                color: Colors.white, // Cor do texto
              ),
            ),
          )
        ],
      ),
    );
  }
}

