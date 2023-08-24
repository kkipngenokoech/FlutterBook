import 'package:flutter/material.dart';
import 'package:flutterbook/notes/notes_model.dart'; // Import your NoteModel class
import 'package:flutterbook/api/firestore.dart';
import 'package:flutterbook/reusable_widgets/error_alert_dialog.dart';
import 'package:flutterbook/reusable_widgets/sucess_alert_dialog.dart'; // Import your FirestoreService

class EditNoteWidgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    final TextEditingController titleController =
        TextEditingController(text: note.title);
    final TextEditingController contentController =
        TextEditingController(text: note.content);

    void _saveChanges() async {
      // Get the modified values from the text fields
      String modifiedTitle = titleController.text;
      String modifiedContent = contentController.text;

      // Update the properties of the 'note' instance directly
      note.title = modifiedTitle;
      note.content = modifiedContent;

      // Update the note in Firestore using your FirestoreService
      try {
        await FirestoreService.updateNote(note);
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return SucessAlertDialogWidget(
                  title: "Sucess", message: 'note updated sucessfully');
            });
        Navigator.pushNamed(context, "/notes");
      } catch (error) {
        showDialog(
          context: context,
            builder: (BuildContext context) {
              return ErrorAlertDialogWidget(
                title: "error",
                icon: const Icon(Icons.error),
                message: error.toString(),
              );
            }
          );
      }
      // Navigate back to the note details screen
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
