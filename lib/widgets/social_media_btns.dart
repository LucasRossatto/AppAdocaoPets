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
