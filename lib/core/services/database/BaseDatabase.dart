import 'dart:async';

import 'package:broken_plural_ar/core/models/WordModel.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:sqlite_demo/ClientModel.dart';
// import 'package:sqflite/sqflite.dart';

abstract class BaseDatabase {
  Future<Database> get database;

  Future initDB();

  Future getWordById(int id);

  Future getWordByString(String word);

  Future<List<WordModel>> getAllClients({int limit = 25});

  Future<bool> newWords(WordModel newWord);
}
