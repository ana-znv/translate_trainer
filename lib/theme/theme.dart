import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 18, 18, 18),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
  scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18),
);
