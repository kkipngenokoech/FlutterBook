import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterbook/notes/notes_model.dart';

class FirestoreService {
  static Future<List<NoteModel>> fetchNotes() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("notes").get();
    return querySnapshot.docs
        .map((doc) =>
            NoteModel.fromMap(doc.id, doc.data() as Map<String, dynamic>))
        .toList();
  }

  final CollectionReference _notesCollection =
      FirebaseFirestore.instance.collection("notes");

  Future<void> addData(String title, String content, Color color) async {
    try {
      await _notesCollection
          .add({'title': title, 'content': content, 'color': color.toString()});
    } catch (error) {
      throw FirebaseException(
          message: "Error adding data to firestore: $error", plugin: '');
    }
  }

  static Future<void> updateNote(NoteModel note) async {
    final noteUpdate =
        FirebaseFirestore.instance.collection('notes').doc(note.id);
    await noteUpdate.update({'title': note.title, 'content': note.content});
  }

  static Future<void> deleteNode(String note) async {
    final CollectionReference notesCollections =
        FirebaseFirestore.instance.collection('notes');
    await notesCollections.doc(note).delete();
  }

  // sign up with firebase auth.
  Future<Object?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return user;
    } catch (error) {
      return "$error";
    }
  }

  Future<Object?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return user;
    } catch (error) {
      return "$error";
    }
  }
}
