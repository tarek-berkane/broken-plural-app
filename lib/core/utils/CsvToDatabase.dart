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
    initDataBase();
  }

  void initDataBase() {
    if (AppData.appState == AppState.Production) {
      _db = RealDatabase.db;
    } else {
      _db = FakeDatabase.db;
    }
  }
}
