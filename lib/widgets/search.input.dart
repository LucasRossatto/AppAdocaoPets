import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/constants/images_assets.dart';

class Search_input extends StatelessWidget {
  const Search_input({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
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
                'Search for pets, name, location...',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              suffixIcon: Image.asset(
                appImages.SearchIcon,
                width: 22,
                height: 22,
              )),
        ),
      ),
    );
  }
}
