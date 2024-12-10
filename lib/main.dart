import 'package:flutter/material.dart';

// Controllers
import 'package:flutter_adocaopets/controllers/auth_controller.dart';
import 'package:flutter_adocaopets/controllers/create_pets_controller.dart';
import 'package:flutter_adocaopets/controllers/feed_pet_controller.dart';
import 'package:flutter_adocaopets/controllers/feed_user_pet_controller.dart';
import 'package:flutter_adocaopets/controllers/user_controller.dart';

// Views
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
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => UserController()),
        ChangeNotifierProvider(create: (_) => FeedUserPetController()),
        ChangeNotifierProvider(create: (_) => FeedPetController()),
        ChangeNotifierProvider(create: (_) => CreatePetController()),
      ],
      child: const MaterialApp(
        title: 'Pet Adoption',
        home: SignInScreen(),
      ),
    );
  }
}
