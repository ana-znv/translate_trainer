import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:translate_trainer/data/database_helper.dart';
import 'package:translate_trainer/models/sentence_model/sentence.dart';

class AddSentence extends StatefulWidget {
  const AddSentence({super.key});

  @override
  State<AddSentence> createState() => _AddSentenceState();
}

class _AddSentenceState extends State<AddSentence> {
  final _formKey = GlobalKey<FormState>();

  final nativeController = TextEditingController();
  final foreignController = TextEditingController();
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

  Future<void> addSentence() async {
    if (nativeController.text.isEmpty || foreignController.text.isEmpty) return;

    final sentence = Sentence(
      nativeSentence: nativeController.text,
      foreignSentence: foreignController.text,
    );
    await dbHelper.insertSentece(sentence);
    nativeController.clear();
    foreignController.clear();
    await loadSentences();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Sentence", style: theme.textTheme.titleMedium),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 40)),
            Container(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 400,
                child: TextField(
                  controller: nativeController,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: theme.textTheme.labelMedium,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Native Sentence',
                    hintStyle: theme.textTheme.labelSmall,
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 400,
                child: TextField(
                  controller: foreignController,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: theme.textTheme.labelMedium,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Foreign Sentence',
                    hintStyle: theme.textTheme.labelSmall,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: addSentence,
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: sentences.length,
                itemBuilder: (context, index) {
                  final s = sentences[index];
                  return ListTile(
                    title: Text(s.nativeSentence),
                    subtitle: Text(s.foreignSentence),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
