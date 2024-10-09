import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/view/CreateAccount_Screen.dart';
import 'package:flutter_adocaopets/view/CreatePet1.dart';
import 'package:flutter_adocaopets/view/CreatePet2.dart';
import 'package:flutter_adocaopets/view/MyPets.dart';
import 'package:flutter_adocaopets/view/Home.screen.dart';
import 'package:flutter_adocaopets/view/Sign_In_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomeScreen(),
    );
  }
}

