import 'package:flutter/material.dart';

class SucessAlertDialogWidget extends StatelessWidget {
  final String title;
  final String message;

  SucessAlertDialogWidget({required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
