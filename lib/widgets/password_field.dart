import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

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
                  color: Color(0xFFEBF0F0), // Cor da borda
                  width: 4.0, // Largura da borda
                ),
              ),
              label: Text(
                'Password',
                style: TextStyle(
                  color: Colors.grey[600],
                  shadows: [
                    Shadow(
                      color: Colors.grey, // Choose the color of the shadow
                      blurRadius:
                          1.0, // Adjust the blur radius for the shadow effect
                      offset: Offset(2.0,
                          2.0), // Set the horizontal and vertical offset for the shadow
                    ),
                  ],
                ),
              ),
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: Color(0xFF5250E1),
              )),
        ),
      ),
    );
  }
}