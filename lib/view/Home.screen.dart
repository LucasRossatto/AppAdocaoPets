import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/constants/images_assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Container(
                  width: 48.0, // Largura do container
                  height: 48.0, // Altura do container
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          appImages.DogProfile), // Imagem asset
                      fit: BoxFit.cover, // Como a imagem deve se ajustar
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
