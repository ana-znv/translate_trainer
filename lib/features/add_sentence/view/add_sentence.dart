import 'package:flutter/material.dart';

class AddSentence extends StatefulWidget {
  const AddSentence({super.key});

  @override
  State<AddSentence> createState() => _AddSentenceState();
}

class _AddSentenceState extends State<AddSentence> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Sentence", style: theme.textTheme.titleMedium),
      ),
    );
  }
}