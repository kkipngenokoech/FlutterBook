import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterbook/notes/notes_model.dart';

class FirestoreService {
  static Future<List<NoteModel>> fetchNotes() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("notes").get();
    return querySnapshot.docs.map((doc) => NoteModel.fromMap(doc.id, doc.data() as Map<String, dynamic>)).toList();
  }

  final CollectionReference _notesCollection = FirebaseFirestore.instance.collection("notes");

  Future<void> addData(String title, String content, Color color) async {
    try {
      await _notesCollection.add({
        'title': title,
        'content': content,
        'color': color.toString()
      });
      
    } catch (error) {
      throw FirebaseException(message: "Error adding data to firestore: $error", plugin: '');
    }
  }
}