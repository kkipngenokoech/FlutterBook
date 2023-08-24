import 'package:flutter/material.dart';

class AppointmentWidgetScreen extends StatelessWidget {
  const AppointmentWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:  ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 60, minWidth: 60),
          child: const FittedBox(
            fit: BoxFit.fill,
            child: Card(
              elevation: 4,
              color: Colors.orange,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child:Text('Dr appointments'),              
                  )
                ],
              )
            )
          )
        )
      ),
    );
  }
}

