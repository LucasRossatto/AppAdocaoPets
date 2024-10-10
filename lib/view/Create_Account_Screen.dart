import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/widgets/email_field.dart';
import 'package:flutter_adocaopets/widgets/password_field.dart';
import 'package:flutter_adocaopets/widgets/social_media_btns.dart';
import '../constants/images_assets.dart';

class CreateaccountScreen extends StatelessWidget {
  const CreateaccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Logo(),
          Text_Container(),
          EmailField(),
          PasswordField(),
          SignupBtn(),
          SocialMedia(),
          Dont_have_account_SignUp(),
        ],
      ),
    );
  }
}

class Dont_have_account_SignUp extends StatelessWidget {
  const Dont_have_account_SignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Sign In",
              style: TextStyle(fontSize: 16, color: Color(0xFF5250E1)),
            ),
          )
        ],
      ),
    );
  }
}

class Text_Container extends StatelessWidget {
  const Text_Container({
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
              "Create your\naccount",
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





class AppleBtn extends StatelessWidget {
  const AppleBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 60, // Padding interno
      decoration: BoxDecoration(
        color: Colors.white, // Cor de fundo do Container
        border: Border.all(
          color: Colors.grey.withOpacity(0.5), // Borda levemente cinza
          width: 1.0, // Largura da borda
        ),
        borderRadius:
            BorderRadius.circular(16.0), // Borda arredondada (opcional)
      ),
      child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.apple,
            color: Colors.black,
            size: 24,
          )),
    );
  }
}

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 60, // Padding interno
      decoration: BoxDecoration(
        color: Colors.white, // Cor de fundo do Container
        border: Border.all(
          color: Colors.grey.withOpacity(0.5), // Borda levemente cinza
          width: 1.0, // Largura da borda
        ),
        borderRadius:
            BorderRadius.circular(16.0), // Borda arredondada (opcional)
      ),
      child: IconButton(
        onPressed: () {
          // Ação do botão
        },
        icon: Image.asset('assets/icons/googleIcon.png',
            width: 24, height: 24), // Ajuste o tamanho se necessário
      ),
    );
  }
}

class FacebookBtn extends StatelessWidget {
  const FacebookBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 60, // Padding interno
      decoration: BoxDecoration(
        color: Colors.white, // Cor de fundo do Container
        border: Border.all(
          color: Colors.grey.withOpacity(0.5), // Borda levemente cinza
          width: 1.0, // Largura da borda
        ),
        borderRadius:
            BorderRadius.circular(16.0), // Borda arredondada (opcional)
      ),
      child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.facebook,
            color: Colors.blue,
            size: 24,
          )),
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

class SignupBtn extends StatelessWidget {
  const SignupBtn({
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
          onPressed: () {},
          child: Text(
            "Sign Up",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
