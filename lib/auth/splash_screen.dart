import 'package:flutter/material.dart';

class SplashScreenAuthWidgetState extends StatelessWidget {
  const SplashScreenAuthWidgetState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Hello there!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                  const SizedBox(height: 30),
                  const Text(
                    "Automatic identity verification which enables you to verify your identity",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/3,
                    decoration: const BoxDecoration(
                      image:DecorationImage(image: AssetImage('assets/images/clipart.jpg'))
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}