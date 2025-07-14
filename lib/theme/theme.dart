import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 32, 32, 32),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 32, 32, 32),
  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: const Color.fromARGB(255, 213, 213, 213),
      fontSize: 26,
    ),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 22),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 39, 39, 39),
    iconTheme: IconThemeData(color: Colors.white70),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 46, 46, 46),
    ),
  ),
);
