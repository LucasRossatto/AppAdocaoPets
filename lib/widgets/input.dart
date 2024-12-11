import 'package:flutter/material.dart';

class input extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;

  const input({super.key, required this.controller, required this.placeholder});

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

            label: Text(
              placeholder,
              style: TextStyle(
                  color: Color.fromARGB(150, 48, 55, 66),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}