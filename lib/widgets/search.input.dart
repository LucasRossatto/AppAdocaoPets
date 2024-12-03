import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/constants/images_assets.dart';

class Search_input extends StatelessWidget {
  const Search_input({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: SizedBox(
        width: 364,
        height: 60,
        child: TextField(
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
                    const BorderSide(color: Color(0xFFEBF0F0), width: 4.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide:
                    const BorderSide(color: Color(0xFFEBF0F0), width: 4.0),
              ),
              label: Text(
                'Procure por pets e usuários...',
                style: TextStyle(
                  color: Color.fromARGB(150, 48, 55, 66),
                  fontWeight: FontWeight.bold)
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
