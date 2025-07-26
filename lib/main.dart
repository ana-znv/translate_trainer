import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:translate_trainer/models/sentence_model/sentence.dart';
import 'package:translate_trainer/translate_trainer_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'sentence_database.db'),

    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE sentences(id INTEGER PRIMARY KEY, nativeSentence TEXT, foreignSentence TEXT)',
      );
    },

    version: 1,
  );

  Future<void> insertSentence(Sentence sentence) async {
    final db = await database;

    await db.insert(
      'sentences',
      sentence.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Sentence>> sentences() async {
    final db = await database;
    final List<Map<String, Object?>> sentenceMap = await db.query('sentences');

    return [
      for (final {
            'id': id as int,
            'nativeSentence': nativeSentence as String,
            'foreignSentence': foreignSentence as String,
          }
          in sentenceMap)
        Sentence(
          id: id,
          nativeSentence: nativeSentence,
          foreignSentence: foreignSentence,
        ),
    ];
  }

  runApp(const TranslateTrainer());
}
