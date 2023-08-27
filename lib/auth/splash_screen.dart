import 'package:flutter/material.dart';

class SplashScreenAuthWidgetState extends StatelessWidget {
  const SplashScreenAuthWidgetState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(

          child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Hello there!",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                const SizedBox(height: 30),
                const Text(
                  "Automatic identity verification which enables you to verify your identity",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/clipart.jpg'))),
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.pushNamed(context, "/signin");
                  },
                  color: Colors.indigoAccent[400],
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white70),
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  minWidth: double.infinity,
                  height: 60,
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
        )
      )),
        )
    );
  }
}
