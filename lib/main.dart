import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterbook/appoitments/appointments.dart';
import 'package:flutterbook/auth/splash_screen.dart';
import 'package:flutterbook/notes/add_notes.dart';
import 'package:flutterbook/notes/edit_note.dart';
import 'package:flutterbook/notes/form_notes.dart';
import 'package:flutterbook/notes/notes.dart';
import 'package:flutterbook/notes/show_note.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlutterBookWidget());
}

class FlutterBookWidget extends StatelessWidget {
  const FlutterBookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/notes': (context) => const NotesWidgetScreen(),
        '/addnotes': (context) => const AddNoteFormWidgetScreen(),
        '/notedetail': (context) =>  NoteDetail(),
        '/editnotedetail': (context) =>  EditNoteWidgetScreen()
      },
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("FlutterBook"),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.date_range),
                  text: "appointments",
                ),
                Tab(
                  icon: Icon(Icons.contacts),
                  text: "contacts",
                ),
                Tab(
                  icon: Icon(Icons.note),
                  text: "notes",
                ),
                Tab(
                  icon: Icon(Icons.assignment_turned_in),
                  text: "tasks",
                )
              ],
            ),
          ),
          body: const Center(
            child: TabBarView(children: [
              Center(
                child: AppointmentWidgetScreen(),
              ),
              Center(
                child: SplashScreenAuthWidgetState(),
                // child: Text("contacts"),
              ),
              Center(
                child: FormsNotesDisplayWidgetScreen()
              ),
              Center(
                child: Text("tasks"),
              )
            ]),
          )
        )
      )
    );
  }
}
