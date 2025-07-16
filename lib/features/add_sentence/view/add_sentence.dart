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
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 40)),
          Container(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 400,
              child: TextField(
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
        ],
      ),
    );
  }
}
