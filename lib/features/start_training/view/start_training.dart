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

  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
      return const Scaffold(
        body: Center(child: Text("You do not have any sentences to train")),
      );
    }

    Sentence rndSentence = getRandomSentence();
    String native = rndSentence.nativeSentence;
    String foreign = rndSentence.foreignSentence;

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Start Training", style: theme.textTheme.titleMedium),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 15)),
          Center(child: Text(native)),
          Padding(padding: EdgeInsets.only(top: 30)),
          Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: controller,
                    autocorrect: false,
                    enableSuggestions: false,
                    maxLines: null,
                    style: theme.textTheme.labelMedium,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Foreign Sentence',
                      hintStyle: theme.textTheme.labelSmall,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.text == foreign) {
                          dbHelper.deleteSentence(rndSentence.id);
                          setState(() {
                            sentences.remove(rndSentence);
                          });
                      } else {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext cont) => AlertDialog(
                            title: const Text("Title"),
                            content: const Text("Wrong"),
                          ),
                        );
                      }
                      controller.clear();
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
