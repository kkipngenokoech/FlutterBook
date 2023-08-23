import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterbook/notes/notes_model.dart';

class FirestoreService {
  static Future<List<NoteModel>> fetchNotes() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("notes").get();
    return querySnapshot.docs.map((doc) => NoteModel.fromMap(doc.id, doc.data() as Map<String, dynamic>)).toList();
  }
}