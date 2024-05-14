import 'dart:async';
import 'package:salt_code_test/data/model/news_table.dart';
import 'package:salt_code_test/domain/params/pagnation_params.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblCache = 'cache';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/news.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $_tblCache (
        id INTEGER PRIMARY KEY,
        sourceId TEXT,
        sourceName TEXT,
        author TEXT,
        title TEXT,
        description TEXT,
        url TEXT,
        urlToImage TEXT,
        publishedAt TEXT,
        content TEXT
     );
    ''');
  }

  Future<void> insertCacheTransaction(List<NewsTable> listNews) async {
    final db = await database;
    db!.transaction((txn) async {
      for (final news in listNews) {
        final newsJson = news.toMap();
        txn.insert(
          _tblCache,
          newsJson,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  Future<List<Map<String, dynamic>>> getNewsCache(PagnationParams params) async {
    final db = await database;
    final List<Map<String, dynamic>> result =
        await db!.query(_tblCache,limit: params.limit, offset: params.offset);
    return result;
  }

  Future<int> clearCache() async {
    final db = await database;
    return await db!.delete(
      _tblCache,
    );
  }
}
