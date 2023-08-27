import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterbook/api/firestore.dart';

class SignupWidgetSceen extends StatefulWidget {
  const SignupWidgetSceen({super.key});

  @override
  State<SignupWidgetSceen> createState() => _SignupWidgetSceenState();
}

class _SignupWidgetSceenState extends State<SignupWidgetSceen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  Future<void> _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      print("Email: ${_emailController.text}");
      print("Password: ${_passwordController.text}");
      var results = await FirestoreService().signUpWithEmailAndPassword(
          _emailController.text, _passwordController.text);
      if (results is User) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User sign up successful")));
        Navigator.pushNamed(context, '/');
      } else if (results is String){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(results)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelText: "full name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "phone number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter your phone number";
                      }
                      return null;
                    }),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your email';
                    }
                    if (!EmailValidator.validate(value)) {
                      return 'please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordConfirmController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "confirm password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return "Passwords doesn't match";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () =>  _submitForm(context), child: const Text("sign up")),
                const Center(
                  child: Text("Already have an account?"),
                )
              ],
            )),
      ),
    );
  }
}
