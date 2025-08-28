import 'package:flutter/material.dart';
import 'package:translate_trainer/router/routes.dart';
import 'package:translate_trainer/theme/theme.dart';

class TranslateTrainer extends StatelessWidget {
  const TranslateTrainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      routes: routes,
    );
  }
}