import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/view/Create_Account_Screen.dart';

class SocialMedia extends StatelessWidget {
   SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
                color: Colors.grey[300], thickness: 2), // Linha à direita
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "or continue with",
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
          ),
          Expanded(
            child: Divider(
                color: Colors.grey[300], thickness: 2), // Linha à direita
          ),
        ],
      ),
    ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FacebookBtn(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GoogleBtn(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppleBtn(),
              ),
            ],
          ),
        ],
      ),
    );;
  }
}