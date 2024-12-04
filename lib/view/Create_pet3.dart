import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Create_Pet3 extends StatefulWidget {
  final String token;
  final String userId;
  final Map<String, String> petData;
  const Create_Pet3(
      {super.key,
      required this.token,
      required this.userId,
      required this.petData});

  @override
  State<Create_Pet3> createState() => _Create_Pet3State();
}

class _Create_Pet3State extends State<Create_Pet3> {
  String imageUrl = "";

  void _openInputDialog() {
    String tempUrl = ""; // Variável temporária para armazenar a URL digitada

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Digite a URL da imagem"),
          content: TextField(
            onChanged: (value) {
              tempUrl = value;
            },
            decoration: InputDecoration(
              hintText: "https://example.com/pet.jpg",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide:
                    const BorderSide(color: Color(0xFFEBF0F0), width: 4.0),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo sem salvar
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                if (tempUrl.isNotEmpty) {
                  setState(() {
                    imageUrl = tempUrl; // Salva a URL digitada
                  });
                }
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: const Text("Salvar"),
            ),
          ],
        );
      },
    );
  }

  Future<bool> _validateImage(String url) async {
    try {
      final response = await NetworkAssetBundle(Uri.parse(url)).load("");
      return response.lengthInBytes > 0;
    } catch (_) {
      return false;
    }
  }

  Widget _buildImageWidget(String url) {
    return FutureBuilder<bool>(
      future: _validateImage(url),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData && snapshot.data == true) {
          return Column(
            children: [
              Text(
                "Pré-visualização da imagem:",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5250E1)),
              ),
              Image.network(
                url,
                width: 428,
                height: 200,
                fit: BoxFit.cover,
              ),
            ],
          );
        } else {
          return const Text(
            "Imagem não é utilizável. Por favor, insira uma URL válida.",
            style: TextStyle(color: Colors.red),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Escolha a foto\nde capa do seu pet",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text("Nome: ${widget.petData['name']}"),
              Text("Idade: ${widget.petData['age']}"),
              Text("Peso: ${widget.petData['weight']}"),
              Text("Cor: ${widget.petData['color']}"),
              Text(widget.petData['imageUrl']!),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(38.0),
            child: GestureDetector(
              onTap: _openInputDialog, // Abre o diálogo ao clicar
              child: Container(
                width: 108,
                height: 108,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFFEBF0F0),
                ),
                child: const Icon(
                  Icons.image_outlined,
                  size: 48,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          if (imageUrl.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildImageWidget(imageUrl), // Valida e exibe a imagem
            ),
          const Padding(
            padding: EdgeInsets.all(14.0),
            child: SizedBox(
              width: 330,
              child: Text(
                "Após escolher a imagem de capa, já estamos na parte final do cadastro do seu pet",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Garantindo que a URL da imagem seja salva antes de navegar
                      if (imageUrl.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Por favor, adicione uma imagem."),
                          ),
                        );
                        return;
                      }

                      // Atualiza a petData com a URL da imagem
                      widget.petData['imageUrl'] = imageUrl;

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Create_Pet3(
                            token: widget.token,
                            userId: widget.userId,
                            petData: widget.petData,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(364, 60),
                      backgroundColor: const Color(0xFF5250E1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Text(
                      'Cadastrar imagem',
                      style: TextStyle(
                        fontSize: 16, // Tamanho da fonte
                        fontWeight: FontWeight.bold, // Negrito
                        color: Colors.white, // Cor do texto
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
