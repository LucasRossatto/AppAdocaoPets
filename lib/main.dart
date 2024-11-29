import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/controllers/auth_controller.dart';
import 'package:flutter_adocaopets/controllers/user_controller.dart';
import 'package:flutter_adocaopets/view/Home.screen.dart';
import 'package:flutter_adocaopets/view/Sign_In_Screen.dart';
import 'package:provider/provider.dart'; // Importe o provider
import 'package:flutter_adocaopets/view/Create_Account_Screen.dart'; // Importe a tela de criação de conta

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Fornecendo o AuthController
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),
        // Fornecendo o UserController
        ChangeNotifierProvider(
          create: (_) => UserController(),
        ),
      ],
      child: MaterialApp(
        title: 'Pet Adoption',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SignInScreen(), // Sua tela inicial
      ),
    );
  }
}
