import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 364,
      height: 60,
      child: TextField(
        decoration: InputDecoration(
          filled: true, 
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0), 
            borderSide: BorderSide(
              color: Color(0xFFEBF0F0),
              width: 4.0, 
            ),
          ),
          label: Text(
            'Email',
            style: TextStyle(
              color: Colors.grey[600],
              shadows: [
                Shadow(
                  color: Colors.grey, 
                  blurRadius:
                      1.0, 
                  offset: Offset(2.0,
                      2.0), 
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
