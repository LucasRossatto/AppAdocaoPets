import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_adocaopets/view/Create_pet3.dart';

class Create_pet2 extends StatefulWidget {
  final String nomeCategorie;
  final String token;
  final String userId;

  const Create_pet2({
    super.key,
    required this.nomeCategorie,
    required this.token,
    required this.userId,
  });

  @override
  State<Create_pet2> createState() => _Create_pet2State();
}

class _Create_pet2State extends State<Create_pet2> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  String? imageUrl;

  Future<bool> _validateImage(String url) async {
    try {
      final response = await NetworkAssetBundle(Uri.parse(url)).load("");
      return response.lengthInBytes > 0;
    } catch (_) {
      return false;
    }
  }

  void _setImage(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Digite a URL da imagem"),
          content: TextField(
            controller: urlController,
            decoration: InputDecoration(
              hintText: "https://example.com/pet.jpg",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () async {
                final url = urlController.text;
                if (url.isNotEmpty) {
                  bool isValid = await _validateImage(url);
                  if (isValid) {
                    setState(() {
                      imageUrl = url;
                    });
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("URL inválida ou imagem inacessível."),
                      ),
                    );
                  }
                }
              },
              child: const Text("Salvar"),
            ),
          ],
        );
      },
    );
  }

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
                    "Detalhes do(a) ${widget.nomeCategorie}",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, bottom: 10, top: 10),
              child: Row(
                children: [
                  Container(
                    width: 66,
                    height: 66,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFFEBF0F0),
                    ),
                    child: IconButton(
                      onPressed: () => _setImage(context),
                      icon: const Icon(Icons.image_outlined),
                      color: Colors.grey,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Clique para escolher a foto do seu Pet",
                      style: TextStyle(
                        color: Color(0xFF5250E1),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (imageUrl != null)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Text(
                      "Pré-visualização da imagem:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5250E1),
                      ),
                    ),
                    Image.network(
                      imageUrl!,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text("Falha ao carregar a imagem.");
                      },
                    ),
                  ],
                ),
              ),
            name_input(controller: nameController),
            age_input(controller: ageController),
            weight_input(controller: weightController),
            color_input(controller: colorController),
            Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final name = nameController.text.trim();
                      final age = ageController.text.trim();
                      final weight = weightController.text.trim();
                      final color = colorController.text.trim();

                      if (name.isEmpty ||
                          age.isEmpty ||
                          weight.isEmpty ||
                          color.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Por favor, preencha todos os campos e selecione uma imagem."),
                          ),
                        );
                        return;
                      }

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Create_Pet3(
                            token: widget.token,
                            userId: widget.userId,
                            petData: {
                              "name": name,
                              "age": age,
                              "weight": weight,
                              "color": color,
                              "imageUrl": imageUrl!,
                            },
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(145, 56),
                      backgroundColor: const Color(0xFF5250E1),
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
            ),
          ],
        ),
      ),
    );
  }
}

class color_input extends StatelessWidget {
  final TextEditingController controller;
  const color_input({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 364,
        height: 60,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide:
                  const BorderSide(color: Color(0xFFEBF0F0), width: 4.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide:
                  const BorderSide(color: Color(0xFFEBF0F0), width: 4.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide:
                  const BorderSide(color: Color(0xFF5250E1), width: 4.0),
            ),
            label: Text('Digite a cor do pet',
                style: TextStyle(
                    color: Color.fromARGB(150, 48, 55, 66),
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}

class weight_input extends StatelessWidget {
  final TextEditingController controller;

  const weight_input({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 364,
        height: 60,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true, // Habilita a cor de fundo
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide:
                  const BorderSide(color: Color(0xFFEBF0F0), width: 4.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide:
                  const BorderSide(color: Color(0xFFEBF0F0), width: 4.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide:
                  const BorderSide(color: Color(0xFF5250E1), width: 4.0),
            ),

            label: Text('Digite a altura do pet em cm',
                style: TextStyle(
                    color: Color.fromARGB(150, 48, 55, 66),
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}

class age_input extends StatelessWidget {
  final TextEditingController controller;

  const age_input({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 364,
        height: 60,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true, // Habilita a cor de fundo
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide:
                  const BorderSide(color: Color(0xFFEBF0F0), width: 4.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide:
                  const BorderSide(color: Color(0xFFEBF0F0), width: 4.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide:
                  const BorderSide(color: Color(0xFF5250E1), width: 4.0),
            ),

            label: Text('Digite a idade do pet',
                style: TextStyle(
                    color: Color.fromARGB(150, 48, 55, 66),
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}

class name_input extends StatelessWidget {
  final TextEditingController controller;

  const name_input({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 364,
        height: 60,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true, // Habilita a cor de fundo
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide:
                  const BorderSide(color: Color(0xFFEBF0F0), width: 4.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide:
                  const BorderSide(color: Color(0xFFEBF0F0), width: 4.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide:
                  const BorderSide(color: Color(0xFF5250E1), width: 4.0),
            ),
            label: Text('Digite o nome do pet',
                style: TextStyle(
                    color: Color.fromARGB(150, 48, 55, 66),
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
