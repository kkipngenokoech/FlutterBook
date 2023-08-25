import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

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
  final TextEditingController _passwordConfirmController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print("Email: ${_emailController.text}");
      print("Password: ${_passwordController.text}");
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
                  decoration: const InputDecoration(labelText: "full name"),
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return 'please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller:_phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: "phone number" ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "please enter your phone number";
                    }
                    return null;
                  }
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your email';
                    }
                    if (!EmailValidator.validate(value)) {
                      return 'please enter a valide email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordConfirmController,
                  obscureText: true,
                  decoration:
                      const InputDecoration(labelText: "confirm password"),
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
                    onPressed: _submitForm, child: const Text("sign up"))
              ],
            )),
      ),
    );
  }
}
