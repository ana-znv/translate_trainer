import 'package:flutter/material.dart';

class StartTraining extends StatefulWidget {
  const StartTraining({super.key});

  @override
  State<StartTraining> createState() => _StartTrainingState();
}

class _StartTrainingState extends State<StartTraining> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Start Training", style: theme.textTheme.titleMedium),
      ),
    );
  }
}