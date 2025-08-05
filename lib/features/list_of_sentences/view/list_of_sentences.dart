import 'package:flutter/material.dart';
import 'package:translate_trainer/data/database_helper.dart';
import 'package:translate_trainer/models/sentence_model/sentence.dart';

class ListOfSentences extends StatefulWidget {
  const ListOfSentences({super.key});

  @override
  State<ListOfSentences> createState() => _ListOfSentencesState();
}

class _ListOfSentencesState extends State<ListOfSentences> {
  final dbHelper = DatabaseHelper.instance;

  List<Sentence> sentences = [];

  @override
  void initState() {
    super.initState();
    loadSentences();
  }

  Future<void> loadSentences() async {
    final data = await dbHelper.getAllSentences();
    setState(() => sentences = data);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Sentences", style: theme.textTheme.titleMedium),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: sentences.length,
          itemBuilder: (context, index) {
            final i = sentences[index];
            return ListTile(
              title: Text(i.nativeSentence),
              subtitle: Text(i.foreignSentence),
            );
          },
        ),
      ),
    );
  }
}
