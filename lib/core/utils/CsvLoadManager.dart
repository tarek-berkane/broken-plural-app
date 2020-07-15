import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class CsvLoadManager {
  var csvList;

  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  bool loadCSV() {
    bool _loadingDone = false;

    loadAsset('assets/data/WordData.csv').then((dynamic output) {
      List<List<dynamic>> rowsAsListOfValues =
          const CsvToListConverter().convert(output, eol: '\n');

      csvList = rowsAsListOfValues;
      _loadingDone = true;
    }, onError: () {
      _loadingDone = false;
    });

    return _loadingDone;
  }

  void csvValidation() {
    // TODO CHECK validation of csv
  }
}
