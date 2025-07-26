import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AddSentence extends StatefulWidget {
  const AddSentence({super.key});

  @override
  State<AddSentence> createState() => _AddSentenceState();
}

class _AddSentenceState extends State<AddSentence> {
  final _formKey = GlobalKey<FormState>();

  late Database db;
  final nativeController = TextEditingController();
  final foreignController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initDb();
  }

  Future<void> initDb() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'sentence_database.db'),

      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE sentences(id INTEGER PRIMARY KEY, nativeSentence TEXT, foreignSentence TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertSentence(
    String nativeSentence,
    String foreignSentence,
  ) async {
    await db.insert('sentences', {
      'nativeSentence': nativeSentence,
      'foreignSentence': foreignSentence,
    });
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
                onPressed: () async {
                  if (nativeController.text.isNotEmpty &&
                      foreignController.text.isNotEmpty) {
                    await insertSentence(
                      nativeController.text,
                      foreignController.text,
                    );
                    nativeController.clear();
                    foreignController.clear();
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Sentence was added')),
                    );
                  }
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
