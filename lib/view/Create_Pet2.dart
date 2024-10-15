import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/constants/images_assets.dart';
import 'package:flutter_adocaopets/view/Create_pet3.dart';

class Create_pet2 extends StatelessWidget {
  const Create_pet2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Pet’s detail",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Container(
                      width: 66,
                      height: 66,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFFEBF0F0),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.image_outlined),
                          color: Colors.grey)
                          ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Upload pet’s avatar",
                      style: TextStyle(color: Color(0xFF5250E1), fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Petname_input(),
            Gender_input(),
            Date_of_birth_input(),
            Date_of_death_input(),
            Breed_input(),
            Description_input(),
            Padding(
              padding: const EdgeInsets.only(right: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Create_Pet3(),
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
            )
          ],
        ),
      ),
    );
  }
}

class Description_input extends StatelessWidget {
  const Description_input({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 364,
        height: 120,
        child: TextField(
          decoration: InputDecoration(
            filled: true, // Habilita a cor de fundo
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0), // Raio da borda
              borderSide: BorderSide(
                color: Color.fromARGB(255, 138, 138, 138), // Cor da borda
                width: 4.0, // Largura da borda
              ),
            ),
            label: Text(
              'Description...',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Breed_input extends StatelessWidget {
  const Breed_input({
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
                color: Color.fromARGB(255, 138, 138, 138), // Cor da borda
                width: 4.0, // Largura da borda
              ),
            ),
            label: Text(
              'Breed',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Date_of_death_input extends StatelessWidget {
  const Date_of_death_input({
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
                  color: Color.fromARGB(255, 138, 138, 138), // Cor da borda
                  width: 4.0, // Largura da borda
                ),
              ),
              label: Text(
                'Date of Death',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              suffixIcon: Image.asset(
                appImages.CalendarIcon,
                color: Colors.grey[600],
                width: 22,
                height: 22,
              )),
        ),
      ),
    );
  }
}

class Date_of_birth_input extends StatelessWidget {
  const Date_of_birth_input({
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
                  color: Color.fromARGB(255, 138, 138, 138), // Cor da borda
                  width: 4.0, // Largura da borda
                ),
              ),
              label: Text(
                'Date of birth',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              suffixIcon: Image.asset(
                appImages.CalendarIcon,
                color: Colors.grey[600],
                width: 22,
                height: 22,
              )),
        ),
      ),
    );
  }
}

class Gender_input extends StatelessWidget {
  const Gender_input({
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
                  color: Color.fromARGB(255, 138, 138, 138), // Cor da borda
                  width: 4.0, // Largura da borda
                ),
              ),
              label: Text(
                'Gender',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              suffixIcon: Image.asset(
                appImages.CapIcon,
                width: 22,
                height: 22,
              )),
        ),
      ),
    );
  }
}

class Petname_input extends StatelessWidget {
  const Petname_input({
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
                color: Color.fromARGB(255, 138, 138, 138), // Cor da borda
                width: 4.0, // Largura da borda
              ),
            ),
            label: Text(
              'Pet’s name',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
