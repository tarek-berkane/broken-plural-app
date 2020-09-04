import 'dart:async';

import 'package:broken_plural_ar/core/models/WordModel.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:sqlite_demo/ClientModel.dart';
// import 'package:sqflite/sqflite.dart';

abstract class BaseDatabase {
  Future<Database> get database;

  Future initDB();

  Future<WordModel> getWordById(int id);

  Future<List<WordModel>> getWordByString(String word);

  Future<List<WordModel>> getAllClients({int limit = 25});

  Future<bool> newWords(List<List<dynamic>> listOfWords);

  Future<List<WordModel>> getRandomWord(int length);
}
