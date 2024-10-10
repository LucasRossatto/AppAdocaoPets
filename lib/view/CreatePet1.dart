import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/Mock/Pet_Categorie_Db.dart';
import 'package:flutter_adocaopets/constants/images_assets.dart';
import 'package:flutter_adocaopets/view/CreatePet2.dart';
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

class third_row_categories extends StatelessWidget {
  const third_row_categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 114,
          height: 109,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26.0),
            color: Color(0xFFEBF0F0),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/horseicon.png',
                    width: 26,
                    height: 26,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "Horse",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 114,
            height: 109,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26.0),
              color: Color(0xFFEBF0F0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/fishIcon.png',
                      width: 26,
                      height: 26,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "Fishes",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 114,
          height: 109,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26.0),
            color: Color(0xFFEBF0F0),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/Paw.png',
                    width: 26,
                    height: 26,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "Other",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class second_row_categories extends StatelessWidget {
  const second_row_categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 114,
          height: 109,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26.0),
            color: Color(0xFFEBF0F0),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/ratIcon.png',
                    width: 26,
                    height: 26,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "Rodent",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 114,
            height: 109,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26.0),
              color: Color(0xFFEBF0F0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/birdIcon.png',
                      width: 26,
                      height: 26,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "Birds",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 114,
          height: 109,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26.0),
            color: Color(0xFFEBF0F0),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/duckIcon.png',
                    width: 26,
                    height: 26,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "Duck",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class first_row_categories extends StatelessWidget {
  const first_row_categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 114,
          height: 109,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26.0),
            color: Color(0xFFEBF0F0),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/dogIcon.png',
                    width: 26,
                    height: 26,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "Dog",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 114,
            height: 109,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26.0),
              color: Color(0xFFEBF0F0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/catIcon.png',
                      width: 26,
                      height: 26,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "Cat",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 114,
          height: 109,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26.0),
            color: Color(0xFFEBF0F0),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/rabbitIcon.png',
                    width: 26,
                    height: 26,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "Rabbit",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
