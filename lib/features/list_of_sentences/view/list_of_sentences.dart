import 'package:flutter/material.dart';

class ListOfSentences extends StatefulWidget {
  const ListOfSentences({super.key});

  @override
  State<ListOfSentences> createState() => _ListOfSentencesState();
}

class _ListOfSentencesState extends State<ListOfSentences> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Sentences", style: theme.textTheme.titleMedium),
      ),
    );
  }
}