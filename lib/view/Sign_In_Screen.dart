import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/controllers/auth_controller.dart';
import 'package:flutter_adocaopets/view/Create_Account_Screen.dart';
import 'package:flutter_adocaopets/view/Home.screen.dart';
import 'package:flutter_adocaopets/widgets/social_media_btns.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importando o provider para gerenciar o estado

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Obtendo o AuthController do contexto
    final authController = Provider.of<AuthController>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Logo(),
              const TextContainer(),
              // Campos de entrada para o email e senha
              _buildEmailField(),
              _buildPasswordField(),
              SignInButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    await _handleSignIn(authController, context);
                  }
                },
                isLoading:
                    authController.isLoading, // Passa o estado de carregamento
              ),
              SocialMedia(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CreateaccountScreen(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Sign Up",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF5250E1)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Campo de entrada para o email
  Widget _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Color(0xFFEBF0F0), width: 4.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
              .hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: _passwordController,
        obscureText: true, // Oculta o texto da senha
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Color(0xFFEBF0F0), width: 4.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
      ),
    );
  }

  Future<void> _handleSignIn(
      AuthController controller, BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final password = _passwordController.text;

      try {
        // Exibir indicador de carregamento
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Autenticando, por favor aguarde...")),
        );

        // Tentar autenticar
        final credentials = await controller.signIn(
            email, password); // Agora retorna um Map<String, String>

        print("Tentando login com: $email");
        print("Credenciais retornadas: $credentials");
        print("Erro do controlador: ${controller.errorMessage}");

        if (credentials != null) {
          final token = credentials['token'];
          final userId = credentials['userId'];

          if (token != null && userId != null) {
            // Salvar token e userId no SharedPreferences
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', token);
            await prefs.setString('userId', userId);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Login bem-sucedido!")),
            );

            // Navegar para a HomeScreen passando token e userId
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeScreen(token: token, userId: userId),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Credenciais inválidas!")),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(controller.errorMessage.isNotEmpty
                    ? controller.errorMessage
                    : "Falha ao realizar login!")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao autenticar: $e")),
        );
      }
    }
  }

// Exibe o diálogo de erro
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content:
              Text(message.isEmpty ? 'An unknown error occurred' : message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const SignInButton(
      {super.key, required this.onPressed, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF5250E1)),
          ),
          onPressed: isLoading
              ? null
              : onPressed, // Desabilita o botão se estiver carregando
          child: isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
        ),
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
            const Text(
              "Sign In",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Personalize your pet’s page with photos, details and memories.",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
