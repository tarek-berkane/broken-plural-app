import 'dart:async';
import 'dart:io';

import 'package:broken_plural_ar/core/models/WordModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:sqlite_demo/ClientModel.dart';
// import 'package:sqflite/sqflite.dart';

abstract class BaseDatabase {
  Database _database;

  Future<Database> get database;

  initDB();

  getWordById(int id);

  getWordByString(String word);

  Future<List<WordModels>> getAllClients({int limit = 25});

  newWord(WordModels newWord);
}
