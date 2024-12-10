import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_adocaopets/controllers/create_pets_controller.dart';
import 'package:flutter_adocaopets/view/Home.screen.dart';
import 'package:flutter_adocaopets/view/MyPets.dart';
import 'package:provider/provider.dart';

class Create_Pet3 extends StatefulWidget {
  final String token;
  final String name;
  final String color;
  final String age;
  final String weight;
  final List<String> images;

  const Create_Pet3({
    super.key,
    required this.token,
    required this.name,
    required this.color,
    required this.age,
    required this.weight,
    required this.images,
  });

  @override
  State<Create_Pet3> createState() => _Create_Pet3State();
}

class _Create_Pet3State extends State<Create_Pet3> {
  String imageUrl = "";

  @override
  void initState() {
    super.initState();

    // Validar se os dados foram recebidos corretamente
    if (widget.token.isEmpty ||
        widget.name.isEmpty ||
        widget.color.isEmpty ||
        widget.age.isEmpty ||
        widget.weight.isEmpty ||
        widget.images.isEmpty) {
      debugPrint("Erro: Dados não foram recebidos corretamente.");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Erro ao carregar os dados do pet.")),
        );
        Navigator.of(context).pop();
      });
    } else {
      debugPrint("Todos os dados foram recebidos com sucesso:");
      //debugPrint("Token: ${widget.token}");
      //debugPrint("Name: ${widget.name}");
      //debugPrint("Color: ${widget.color}");
      //debugPrint("Age: ${widget.age}");
      //debugPrint("Weight: ${widget.weight}");
      //debugPrint("Images: ${widget.images}");
    }
  }

  void _openInputDialog() {
    String tempUrl = "";

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
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                if (tempUrl.isNotEmpty) {
                  setState(() {
                    imageUrl = tempUrl;
                  });
                }
                Navigator.of(context).pop();
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
              const Text(
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

  void _printPetDetails() {
    debugPrint("Token: ${widget.token}");
    debugPrint("Name: ${widget.name}");
    debugPrint("Color: ${widget.color}");
    debugPrint("Age: ${widget.age}");
    debugPrint("Weight: ${widget.weight}");
    debugPrint("Images: ${widget.images.join(', ')}");
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CreatePetController>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Escolha a foto\nde capa do seu pet",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,right: 10,bottom: 10),
            child: Text(
                          "Toque no icone abaixo para escolher a foto",

                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFF5250E1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
            padding: EdgeInsets.all(10.0),
            child: SizedBox(
              width: 330,
              child: Text(
                "Após escolher a imagem de capa,\ntoque no botão abaixo para concluir o cadastro do seu pet",
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
                    onPressed: () async {
                      if (imageUrl.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Por favor, adicione uma imagem de capa."),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      // Adiciona a URL da imagem na lista de imagens
                      final updatedImages = List<String>.from(widget.images)
                        ..add(imageUrl);

                      final petController = Provider.of<CreatePetController>(
                          context,
                          listen: false);

                      // Exibe um indicador de carregamento
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );

                      try {
                        // Chama o método de criação do pet
                        await petController.createPet(
                          token: widget.token,
                          name: widget.name,
                          color: widget.color,
                          age: widget.age,
                          weight: widget.weight,
                          images: updatedImages,
                        );

                        // Fecha o indicador de carregamento
                        Navigator.of(context).pop();

                        // Exibe uma mensagem de sucesso
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Pet cadastrado com sucesso!"),
                            backgroundColor: Colors.green,
                          ),
                        );

                        // Redireciona para outra página (ou volta para a anterior)
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => Mypets(
                              token: widget.token,
                              userId: '',
                            ),
                          ),
                        );
                      } catch (e) {
                        // Fecha o indicador de carregamento
                        Navigator.of(context).pop();

                        // Exibe mensagem de erro
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Erro ao cadastrar o pet: ${e.toString()}"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(364, 60),
                      backgroundColor: const Color(0xFF5250E1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Text(
                      'Adicionar Pet',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
