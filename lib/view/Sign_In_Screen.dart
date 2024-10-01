import 'package:flutter/material.dart';
import '../constants/images_assets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Image.network(
                "https://i.ibb.co/S6TShv4/Logo-1.png",
                height: 70,
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
          Text(
            "Create your account",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
          Text(
            "Personalise your pet’s page with photos, details and memories.",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Email'),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          ElevatedButton(
            
            onPressed: () {},
            child: Text("Signup"),
          ),
          Text("or continue with"),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
              IconButton(onPressed: () {}, icon: Icon(Icons.g_mobiledata)),
              IconButton(onPressed: () {}, icon: Icon(Icons.apple)),
            ],
          ),
          Text("Already have an account?  Sign in")
        ],
      ),
    );
  }
}
