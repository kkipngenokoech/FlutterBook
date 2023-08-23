import 'package:flutter/material.dart';
import 'package:flutterbook/notes/notes_model.dart';

class NoteDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NoteModel note =
        ModalRoute.of(context)!.settings.arguments as NoteModel;
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
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/editnotedetail", arguments: note);
                },
                child: const Text("edit")),
            const SizedBox(width: 16),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('delete'))
          ],
        )
      ]),
    ));
  }
}
