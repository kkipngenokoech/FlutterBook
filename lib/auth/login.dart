import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbook/api/firestore.dart';

class LoginWidgetScreen extends StatefulWidget {
  const LoginWidgetScreen({super.key});

  @override
  State<LoginWidgetScreen> createState() => _LoginWidgetScreenState();
}

class _LoginWidgetScreenState extends State<LoginWidgetScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _handleLogin(BuildContext context) async {
    var results = await FirestoreService().signInWithEmailAndPassword(_emailController.text, _passwordController.text);
    if (results is User) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("user sign in successfully")));
      Navigator.pushNamed(context, '/');
    } else if (results is String){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(results)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: "email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            ElevatedButton(
              onPressed: () => _handleLogin(context),
              child: const Text("Sign in"),
            )
          ],
        )),
      ),
    );
  }
}
