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
    labelMedium: TextStyle(
      color: const Color.fromARGB(255, 220, 220, 220),
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      fontSize: 18,
      color: Color.fromARGB(166, 212, 212, 212),
    ),
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
