import 'package:flutter/material.dart';
import 'package:flutterbook/api/firestore.dart';

class AddNoteFormWidgetScreen extends StatefulWidget {
  const AddNoteFormWidgetScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteFormWidgetScreen> createState() =>
      _AddNoteFormWidgetScreenState();
}

class _AddNoteFormWidgetScreenState extends State<AddNoteFormWidgetScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Color? selectedColor;
  final FirestoreService _firestoreService = FirestoreService();

  void _onFormSubmitted() {
    if (formKey.currentState!.validate()) {
      final title = titleController.text;
      final content = contentController.text;
      final color = selectedColor ?? Colors.grey;

      try {
        _firestoreService.addData(title, content, color);
        _showSucessDialog(context);
      } catch (error) {
        _showErrorDialog(context, error.toString());
      }
    }
  }

  void _showSucessDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return  AlertDialog(
          title: const Text('success'),
          content: const Text("New Note added sucessfully"),
          actions: <Widget>[
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, "/notes");
              },
              child: const Text("ok")
            )
          ],
        );
      }
    );
  }

  void _showErrorDialog(BuildContext context, String errorMessage){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Error"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text("Try again?"),
              onPressed: (){
                Navigator.of(context).pop();
              }),
          ],
        );
      }
    );
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title is required!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Content is required!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<Color>(
                decoration: const InputDecoration(labelText: 'Color'),
                value: selectedColor,
                items: Colors.primaries.map<DropdownMenuItem<Color>>(
                  (color) {
                    return DropdownMenuItem<Color>(
                      value: color,
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            color: color,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            color.toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedColor = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _onFormSubmitted,
                child: const Text("Add note"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
