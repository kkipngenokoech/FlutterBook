import 'package:flutter/material.dart';
import 'package:flutterbook/api/firestore.dart';
import 'package:flutterbook/notes/notes_model.dart';

class NotesWidgetScreen extends StatelessWidget {
  const NotesWidgetScreen({Key? key}) : super(key: key);

  Color getColorFromString(String colorName) {
    switch (colorName) {
      case 'blue':
        return Colors.blue;
      case 'red':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _showNoteDetails(BuildContext context, NoteModel note) {
    Navigator.pushNamed(context, '/notedetail', arguments: note);
  }

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
              Color cardColor = getColorFromString(note.color);
              return GestureDetector(
                  onTap: () {
                    _showNoteDetails(context, note);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        elevation: 4,
                        color: cardColor,
                        child: ListTile(
                          title: Text(note.title),
                          subtitle: Text(note.content),
                        )),
                  ));
            },
          );
        },
      ),
    );
  }
}
