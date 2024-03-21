import 'dart:io';
import 'package:locks/model/lock_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // single reference to the database
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    // only works on mobile, directory path not found on web
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    String path = join(docsDirectory.path, 'locks.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE locks(
type INTEGER PRIMARY KEY,
title STRING,
primaryValue STRING,
secondaryValue STRING,
defaultValue STRING
)
''');
  }

  Future<List<LockItem>> queryItems() async {
    Database db = await instance.database;
    var locks = await db.query('locks');
    List<LockItem> lockList =
        locks.isNotEmpty ? locks.map((e) => LockItem.fromMap(e)).toList() : [];
    return lockList;
  }

  Future<int> insert(LockItem item) async {
    Database db = await instance.database;
    return await db.insert('locks', item.toMap());
  }

  Future<int> update(LockItem item) async {
    Database db = await instance.database;
    return await db.update('locks', item.toMap(),
        where: 'type = ?', whereArgs: [item.type]);
  }
}
