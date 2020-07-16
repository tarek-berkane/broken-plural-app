import 'package:broken_plural_ar/core/common/loggin.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class CsvLoadManager {
  var csvList;

  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<bool> loadCSV() async {
    bool _loadingDone = false;

    try {
      var rawCSVdata = await loadAsset('assets/data/WordData.csv');

      List<List<dynamic>> rowsAsListOfValues =
          const CsvToListConverter().convert(rawCSVdata, eol: '\n');

      csvList = rowsAsListOfValues;
      _loadingDone = true;
    } catch (e) {
      consoleLog(e.toString(), typeLog: 'ERROR', scope: "loadCSV > onError");
      _loadingDone = false;
    }

    return _loadingDone;
  }

  void csvValidation() {
    // TODO CHECK validation of csv
  }
}
