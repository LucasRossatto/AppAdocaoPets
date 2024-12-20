// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/view/Home.screen.dart';
import 'package:flutter_adocaopets/view/MyPets.dart';
import 'package:flutter_adocaopets/view/Sign_In_Screen.dart';
import 'package:flutter_adocaopets/widgets/Swtich_Btn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/auth_controller.dart';
import '../constants/images_assets.dart';

// ignore: camel_case_types
class Profile_Screen extends StatelessWidget {
  final String token;
  final String userId;
  const Profile_Screen({required this.token, required this.userId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 28, right: 28),
            child: Header(),
          ),
          ProfileImageUsernames(),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SizedBox(
              child: Column(
                children: [
                  Divider(height: 0),
                  EditAccount(),
                  Divider(height: 0),
                  Notifications(),
                  Divider(height: 0),
                  HelpInfo(),
                  Divider(height: 0),
                  ThemeSwitch(),
                  Divider(height: 0),
                  LogoutButton()
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>
                        HomeScreen(token: token, userId: userId),
                  ),
                );
              },
                icon: Image.asset(
                  'assets/icons/HomeOutlined.png',
                  width: 24,
                  height: 24,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>
                        Mypets(token: token, userId: userId),
                  ),
                );
              },
                icon: Image.asset(
                  'assets/icons/Paw.png',
                  width: 24,
                  height: 24,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/icons/Message.png',
                    width: 24, height: 24),
              ),
              IconButton(
                onPressed: () {
                },
                icon: Image.asset(
                  'assets/icons/PersonFilled.png',
                  width: 24,
                  height: 24,
                  color: const Color(0xFF5250E1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileImageUsernames extends StatelessWidget {
  const ProfileImageUsernames({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

    // Acessar os dados do usuário
    final userName = authController.userDetails?['user']?['name'] ?? 'Guest';
    final userEmail = authController.userDetails?['user']?['email'] ?? '';

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          ClipOval(
            child: Container(
              width: 108.0, // Largura do container
              height: 108.0, // Altura do container
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(appImages.DogProfile), // Imagem padrão
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            "$userName", // Exibe o nome do usuário
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(
            "email: $userEmail", // Exibe o e-mail do usuário como nome de usuário
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Conta",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings_outlined),
                iconSize: 24,
                color: const Color.fromARGB(255, 0, 0, 0)))
      ],
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  Future<void> logout(BuildContext context) async {
    try {
      // Limpa os dados locais
      final data = await SharedPreferences.getInstance();
      await data.clear();

      // leva usuário para tela de login
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    } catch (e) {
      // Opcional: Mostra uma mensagem de erro caso algo dê errado
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao fazer logout: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.exit_to_app_rounded,
            size: 24,
            color: Color(0xFFFC7171),
          ),
        ),
        title: const Text(
          "Desconectar",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFC7171),
          ),
        ),
        onTap: () => logout(context),
      ),
    );
  }
}

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: const ListTile(
        leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.remove_red_eye_outlined,
              size: 24,
            )),
        title: Text(
          "Tema claro",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: SwitchBtn(),
      ),
    );
  }
}

class HelpInfo extends StatelessWidget {
  const HelpInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: const ListTile(
        leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.info_outline,
              size: 24,
            )),
        title: Text(
          "Ajuda",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class Notifications extends StatelessWidget {
  const Notifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: const ListTile(
        leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.notifications_none_rounded,
              size: 24,
            )),
        title: Text(
          "Notificações",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class EditAccount extends StatelessWidget {
  const EditAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: const ListTile(
        leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.edit_outlined,
              size: 24,
            )),
        title: Text(
          "Editar conta",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}