import 'dart:math';

import 'package:flutter/material.dart';
import 'package:translate_trainer/data/database_helper.dart';
import 'package:translate_trainer/models/sentence_model/sentence.dart';

class StartTraining extends StatefulWidget {
  const StartTraining({super.key});

  @override
  State<StartTraining> createState() => _StartTrainingState();
}

class _StartTrainingState extends State<StartTraining> {
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

  Sentence getRandomSentence() {
    Random random = Random();
    int index = random.nextInt(sentences.length);
    return sentences[index];
  }

  @override
  Widget build(BuildContext context) {
    if (sentences.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    Sentence sentenceForTest = getRandomSentence();

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Start Training", style: theme.textTheme.titleMedium),
      ),
      body: Column(
        children: [
          Text(sentenceForTest.nativeSentence),
          Text(sentenceForTest.foreignSentence),
        ],
      ),
    );
  }
}
