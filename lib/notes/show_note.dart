import 'package:flutter/material.dart';
import 'package:flutterbook/api/firestore.dart';
import 'package:flutterbook/notes/notes_model.dart';

class NoteDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NoteModel note =ModalRoute.of(context)!.settings.arguments as NoteModel;
    void _deleteNote() async {
      FirestoreService.deleteNode(note.id);
    }
    void _showDeleteConfirmationDialog() async {
      bool _confirmDelete = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Confirm Action"),
              content: Text("Are you sure you want to delete this node?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text("cancel")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text("Delete"))
              ],
            );
          });
      if (_confirmDelete == true) {
        _deleteNote();
      }
    }

    

    return Scaffold(
        body: Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          // color: note.color,
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(note.content)
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/editnotedetail",
                      arguments: note);
                },
                icon: const Icon(Icons.edit),
                label: const Text("edit")),
            const SizedBox(width: 16),
            ElevatedButton.icon(
                onPressed: _showDeleteConfirmationDialog,
                icon: const Icon(Icons.delete),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                label: const Text('delete'))
          ],
        )
      ]),
    ));
  }
}
