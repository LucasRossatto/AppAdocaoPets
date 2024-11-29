import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key, required TextEditingController controller});

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
