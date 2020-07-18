import 'package:broken_plural_ar/core/common/loggin.dart';
import 'package:broken_plural_ar/core/data/AppData.dart';
import 'package:broken_plural_ar/core/services/database/BaseDatabase.dart';
import 'package:broken_plural_ar/core/services/database/FakeDatabase.dart';
import 'package:broken_plural_ar/core/services/database/RealDatabase.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class CsvToDatabase {
  var csvData;
  BaseDatabase _db;

  CsvToDatabase({@required this.csvData}) {
    assert(this.csvData != null);
  }

  Future _initDataBase() async {
    if (AppData.appState == AppState.Production) {
      _db = RealDatabase.db;
    } else {
      _db = FakeDatabase.db;
    }

    bool loaded = await _db.initDB();
    if (!loaded) {
      consoleLog('throw Exception Database init', typeLog: 'ERROR');
      throw Exception("Database init Exception");
    }
  }

  Future pushToDatabase(List<List<dynamic>> data) async {
    await _initDataBase();

    _db.newWords(data);
  }
}
