import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/view/Create_Account_Screen.dart';
import 'package:flutter_adocaopets/view/Create_Pet1.dart';
import 'package:flutter_adocaopets/view/Create_Pet2.dart';
import 'package:flutter_adocaopets/view/Create_pet3.dart';
import 'package:flutter_adocaopets/view/MyPets.dart';
import 'package:flutter_adocaopets/view/Home.screen.dart';
import 'package:flutter_adocaopets/view/Pet_Profile.dart';
import 'package:flutter_adocaopets/view/Profile_screen.dart';
import 'package:flutter_adocaopets/view/Sign_In_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Adoption',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Pet_profile(),
    );
  }
}

