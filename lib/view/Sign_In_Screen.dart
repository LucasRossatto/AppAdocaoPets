import 'package:flutter/material.dart';
import '../constants/images_assets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Logo(),
          Text_Container(),
          Email_Field(),
          Password_Field(),
          SignupBtn(),
          Or_Continue_Line(),
          Social_Media_Btns(),
          Padding(
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

class Social_Media_Btns extends StatelessWidget {
  const Social_Media_Btns({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class Or_Continue_Line extends StatelessWidget {
  const Or_Continue_Line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class Password_Field extends StatelessWidget {
  const Password_Field({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 364,
        height: 60,
        child: TextField(
          decoration: InputDecoration(
              filled: true, // Habilita a cor de fundo
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0), // Raio da borda
                borderSide: BorderSide(
                  color: Color(0xFFEBF0F0), // Cor da borda
                  width: 4.0, // Largura da borda
                ),
              ),
              label: Text(
                'Password',
                style: TextStyle(
                  color: Colors.grey[600],
                  shadows: [
                    Shadow(
                      color: Colors.grey, // Choose the color of the shadow
                      blurRadius:
                          1.0, // Adjust the blur radius for the shadow effect
                      offset: Offset(2.0,
                          2.0), // Set the horizontal and vertical offset for the shadow
                    ),
                  ],
                ),
              ),
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey[600],
              )),
        ),
      ),
    );
  }
}

class Email_Field extends StatelessWidget {
  const Email_Field({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 364,
      height: 60,
      child: TextField(
        decoration: InputDecoration(
          filled: true, // Habilita a cor de fundo
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0), // Raio da borda
            borderSide: BorderSide(
              color: Color(0xFFEBF0F0), // Cor da borda
              width: 4.0, // Largura da borda
            ),
          ),
          label: Text(
            'Email',
            style: TextStyle(
              color: Colors.grey[600],
              shadows: [
                Shadow(
                  color: Colors.grey, // Choose the color of the shadow
                  blurRadius:
                      1.0, // Adjust the blur radius for the shadow effect
                  offset: Offset(2.0,
                      2.0), // Set the horizontal and vertical offset for the shadow
                ),
              ],
            ),
          ),
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
                Color(0xFFC4C4C4)), // Define a cor de fundo
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
