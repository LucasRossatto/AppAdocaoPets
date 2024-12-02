import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/constants/images_assets.dart';
import 'package:flutter_adocaopets/controllers/user_controller.dart';
import 'package:flutter_adocaopets/view/sign_in_screen.dart';
import 'package:flutter_adocaopets/widgets/social_media_btns.dart';
import 'package:provider/provider.dart';

class CreateaccountScreen extends StatefulWidget {
  const CreateaccountScreen({super.key});

  @override
  _CreateaccountScreenState createState() => _CreateaccountScreenState();
}

class _CreateaccountScreenState extends State<CreateaccountScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _errorMessage = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Column(
                  children: [
                    const Logo(),
                    const Text_Container(),
                    _buildTextField(_nameController, 'Digite seu nome'),
                    Padding(padding: const EdgeInsets.all(6)),
                    _buildTextField(_emailController, 'Digite seu Email'),
                    Padding(padding: const EdgeInsets.all(6)),
                    _buildTextField(_phoneController, 'Digite seu Phone'),
                    Padding(padding: const EdgeInsets.all(6)),
                    _buildPasswordField(_passwordController, 'Digite sua senha'),
                    Padding(padding: const EdgeInsets.all(6)),
                    _buildconfirmPasswordField(
                        _confirmPasswordController, 'Confirme sua senha'),
                    if (_errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _errorMessage,
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ),
                    SignupBtn(onPressed: _signUp),
                    SocialMedia(),
                    const Dont_have_account_SignUp(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _errorMessage = '';
      });

      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final phone = _phoneController.text.trim();
      final password = _passwordController.text.trim();
      final confirmpassword = _confirmPasswordController.text.trim();

      if (password != confirmpassword) {
        setState(() {
          _errorMessage = 'Passwords do not match';
        });
        return;
      }

      final userController =
          Provider.of<UserController>(context, listen: false);

      try {
        await userController.createAccount(
          name: name,
          email: email,
          phone: phone,
          password: password,
          confirmpassword: confirmpassword,
        );

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SignInScreen()),
        );
      } catch (e) {
        setState(() {
          _errorMessage = 'Error: ${e.toString()}';
        });
      }
    }
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return SizedBox(
      width: 364,
      height: 60,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Color(0xFFEBF0F0), width: 4.0),
          ),
          label: Text(label, style: TextStyle(color: Colors.grey[600])),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, String label,
      {bool isPassword = true}) {
    return SizedBox(
      width: 364,
      height: 60,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Color(0xFFEBF0F0), width: 4.0),
          ),
          label: Text(label, style: TextStyle(color: Colors.grey[600])),
          suffixIcon: Icon(Icons.remove_red_eye, color: Color(0xFF5250E1)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildconfirmPasswordField(
      TextEditingController controller, String label,
      {bool isPassword = true}) {
    return SizedBox(
      width: 364,
      height: 60,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Color(0xFFEBF0F0), width: 4.0),
          ),
          label: Text(label, style: TextStyle(color: Colors.grey[600])),
          suffixIcon: Icon(Icons.remove_red_eye, color: Color(0xFF5250E1)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}

class SignupBtn extends StatelessWidget {
  final VoidCallback onPressed;

  const SignupBtn({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 364,
        height: 60,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF5250E1)),
          ),
          onPressed: onPressed,
          child: const Text(
            "Sign Up",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class Dont_have_account_SignUp extends StatelessWidget {
  const Dont_have_account_SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Already have an account?",
              style: TextStyle(fontSize: 16)),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SignInScreen()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 16, color: Color(0xFF5250E1)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Text_Container extends StatelessWidget {
  const Text_Container({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Crie sua conta",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
          Text("Encontre seu melhor amigo de quatro patas",
              style: TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Image.asset(appImages.Logo, height: 70),
      ),
    );
  }
}
