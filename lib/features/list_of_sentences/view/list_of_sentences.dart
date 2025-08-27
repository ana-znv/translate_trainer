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

  void delete(Sentence sentence) {
    dbHelper.deleteSentence(sentence.id);
    setState(() {
      sentences.remove(sentence);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Sentences", style: theme.textTheme.titleMedium),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: sentences.length,
              separatorBuilder: (context, index) => const Divider(
                color: Color.fromARGB(255, 61, 61, 61),
                height: 20,
                indent: 10,
                endIndent: 10,
              ),
              itemBuilder: (context, index) {
                final i = sentences[index];
                return ListTile(
                  title: Text(
                    "Native: ${i.nativeSentence}",
                    style: theme.textTheme.labelMedium,
                  ),
                  subtitle: Text(
                    "Foreign: ${i.foreignSentence}",
                    style: theme.textTheme.labelSmall,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      delete(i);
                    },
                    icon: Icon(Icons.delete_outline),
                    color: Colors.white60,
                    iconSize: 30,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
