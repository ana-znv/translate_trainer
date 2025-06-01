import 'package:flutter/material.dart';

class AddSentenceScreen extends StatelessWidget {
  const AddSentenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text("Add sentence", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}