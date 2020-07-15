import 'package:broken_plural_ar/core/data/AppData.dart';
import 'package:broken_plural_ar/core/services/database/BaseDatabase.dart';
import 'package:broken_plural_ar/core/services/database/FakeDatabase.dart';
import 'package:broken_plural_ar/core/services/database/RealDatabase.dart';
import 'package:flutter/cupertino.dart';

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
    await _db.initDB();
  }

  void pushToDatabase(List<List<String>> data) async {
    await _initDataBase();
    // TODO convert csv data to List of WordModel
    // _db.newWords()
  }
}
