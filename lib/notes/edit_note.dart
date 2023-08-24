import 'package:flutter/material.dart';
import 'package:flutterbook/notes/notes_model.dart'; // Import your NoteModel class

class EditNoteWidgetScreen extends StatelessWidget {
  // final NoteModel note;

  // EditNoteWidgetScreen({required this.note});

  @override
  Widget build(BuildContext context) {
    final NoteModel note =
        ModalRoute.of(context)!.settings.arguments as NoteModel;
    final TextEditingController titleController =
        TextEditingController(text: note.title);
    final TextEditingController contentController =
        TextEditingController(text: note.content);

    void _saveChanges() {
      print(titleController);
      Navigator.pop(context); // Navigate back to note details screen
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(labelText: 'Content'),
            ),
            const SizedBox(height: 16),
            // Implement color picker widget or other UI for choosing color
            ElevatedButton(
              onPressed: _saveChanges,
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
