import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/controllers/auth_controller.dart';
import 'package:flutter_adocaopets/controllers/create_pets_controller.dart';
import 'package:flutter_adocaopets/controllers/feed_user_pet_controller.dart';
import 'package:flutter_adocaopets/controllers/user_controller.dart';
import 'package:flutter_adocaopets/view/Sign_In_Screen.dart';
import 'package:provider/provider.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserController(),
        ),
          ChangeNotifierProvider(
          create: (_) => FeedUserPetController(),
        ),
        ChangeNotifierProvider(
      create: (context) => CreatePetController(),
      child: MyApp(),
    ),

      ],
      child: MaterialApp(
        title: 'Pet Adoption',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  SignInScreen(), // Sua tela inicial
      ),
    );
  }
}
