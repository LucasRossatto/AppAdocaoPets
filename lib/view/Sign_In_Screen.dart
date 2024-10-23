import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/constants/images_assets.dart';
import 'package:flutter_adocaopets/view/Create_Account_Screen.dart';
import 'package:flutter_adocaopets/view/Home.screen.dart';
import 'package:flutter_adocaopets/widgets/email_field.dart';
import 'package:flutter_adocaopets/widgets/password_field.dart';
import 'package:flutter_adocaopets/widgets/social_media_btns.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Logo(),
          TextContainer(),
          EmailField(),
          PasswordField(),
          Sign_In_Btn(),
          SocialMedia(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CreateaccountScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 16, color: Color(0xFF5250E1)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  const TextContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign In",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            Text(
              "Personalise your pet’s page with photos, details and memories.",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Image.asset(
          appImages.Logo,
          height: 70,
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}

class Sign_In_Btn extends StatelessWidget {
  const Sign_In_Btn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 364,
        height: 60,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Color(0xFF5250E1)), // Define a cor de fundo
          ),
          onPressed: () {
             Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
          },
          child: Text(
            "Sign In",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
