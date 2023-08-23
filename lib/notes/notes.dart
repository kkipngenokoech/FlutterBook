import 'package:flutter/material.dart';
import 'package:flutterbook/api/firestore.dart';
import 'package:flutterbook/notes/notes_model.dart';

class NotesWidgetScreen extends StatelessWidget {
  const NotesWidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirestoreService.fetchNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text('No data available'),
            );
          }
          List<NoteModel> notes = snapshot.data as List<NoteModel>;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              NoteModel note = notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.id),
                // You can add more information from the 'note' object here
              );
            },
          );
        },
      ),
    );
  }
}
