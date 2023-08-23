import 'package:flutter/material.dart';
import 'package:flutterbook/notes/notes_model.dart';

class EditNoteWidgetScreen extends StatelessWidget {
  const EditNoteWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteModel note =
        ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: TextEditingController(text: note.title),
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: TextEditingController(text: note.content),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    
                    Navigator.pop(context);
                  },
                  child: const Text("Save changes"))
            ],
          ),
        ),
      ),
    );
  }
}
