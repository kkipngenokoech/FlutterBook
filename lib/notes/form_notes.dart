import 'package:flutter/material.dart';
import 'package:flutterbook/notes/add_notes.dart';
import 'package:flutterbook/notes/notes.dart';

class FormsNotesDisplayWidgetScreen extends StatefulWidget {
  const FormsNotesDisplayWidgetScreen({super.key});

  @override
  State<FormsNotesDisplayWidgetScreen> createState() =>
      _FormsNotesDisplayWidgetScreenState();
}

class _FormsNotesDisplayWidgetScreenState
    extends State<FormsNotesDisplayWidgetScreen> {
   bool _showAddNotesForm = false;
  void _toggleAddFormNote() {
    setState(() {
      _showAddNotesForm = !_showAddNotesForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _showAddNotesForm
              ? const AddNoteFormWidgetScreen()
              : const NotesWidgetScreen()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleAddFormNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}
