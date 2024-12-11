import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_adocaopets/view/Create_pet3.dart';
import 'package:flutter_adocaopets/widgets/input.dart';

class Create_pet2 extends StatefulWidget {
  final String nomeCategorie;
  final String token;
  final String userId;
  final String category;

  const Create_pet2({
    super.key,
    required this.nomeCategorie,
    required this.token,
    required this.userId,
    required this.category,
  });

  @override
  State<Create_pet2> createState() => _Create_pet2State();
}

class _Create_pet2State extends State<Create_pet2> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController breedController = TextEditingController();
  final TextEditingController storyController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

  String imageUrl = "";
  String? selectedGender; // Armazena o gênero selecionado

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
              padding: const EdgeInsets.only(left: 23, bottom: 20),
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
            InkWell(
              onTap: () => _setImage(context),
              child: Padding(
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
                        onPressed: () {},
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
            ),
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
                    imageUrl,
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
            input(
                controller: nameController,
                placeholder: "Digite o nome do seu pet"),
            input(
                controller: breedController,
                placeholder: "Digite a raça do seu pet"),
            input(
                controller: ageController,
                placeholder: "Digite a idade do seu pet"),
            input(
                controller: weightController,
                placeholder: "Digite o tamanho do seu pet em cm"),
            input(
                controller: colorController,
                placeholder: "Digite a cor do seu pet"),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: SizedBox(
                child: DropdownButtonFormField<String>(
                  value: selectedGender,
                  items: const [
                    DropdownMenuItem(
                      value: "male",
                      child: Text("Macho"),
                    ),
                    DropdownMenuItem(
                      value: "female",
                      child: Text("Fêmea"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Selecione o gênero",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFEBF0F0), width: 4.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFEBF0F0), width: 4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: const BorderSide(
                          color: Color(0xFF5250E1), width: 4.0),
                    ),
                  ),
                ),
              ),
            ),
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
                      final breed = breedController.text.trim();
                      final gender = selectedGender;

                      if (name.isEmpty ||
                          age.isEmpty ||
                          weight.isEmpty ||
                          color.isEmpty ||
                          imageUrl.isEmpty ||
                          breed.isEmpty ||
                          selectedGender == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Por favor, preencha todos os campos, selecione uma imagem e um gênero."),
                          ),
                        );
                        return;
                      }

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Create_Pet3(
                            token: widget.token,
                            name: name,
                            color: color,
                            age: age,
                            weight: weight,
                            images: [imageUrl],
                            category: widget.category,
                            gender: gender.toString(),
                            breed: breed,
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


