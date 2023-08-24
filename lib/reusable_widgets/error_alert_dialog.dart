import 'package:flutter/material.dart';

class ErrorAlertDialogWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final String message;
  ErrorAlertDialogWidget({required this.title, required this.message, required this.icon});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          icon,
          const SizedBox(width: 8),
          Text(title),
        ],
      ),
      content: Text(message),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("retry?"))
      ],
    );
  }
}
