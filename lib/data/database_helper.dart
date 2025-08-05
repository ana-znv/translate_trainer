import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:translate_trainer/models/sentence_model/sentence.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('sentences.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE sentences(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nativeSentence TEXT NOT NULL,
      foreignSentence TEXT NOT NULL  
    )
    ''');
  }

  Future<int> insertSentece(Sentence sentence) async {
    final db = await instance.database;
    return await db.insert(
      'sentences',
      sentence.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Sentence>> getAllSentences() async {
    final db = await instance.database;
    final result = await db.query('sentences', orderBy: 'id DESC');
    return result.map((map) => Sentence.fromMap(map)).toList();
  }

  Future<void> deleteSentence(String native) async {
    final db = await instance.database;

    await db.delete('sentences', where: 'nativeSentence = ?', whereArgs: [native]);
  }
}
