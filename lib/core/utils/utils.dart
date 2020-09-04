import 'dart:io';

import 'package:broken_plural_ar/core/models/WordModel.dart';
import 'package:csv/csv.dart';

// import '../model/word_model.dart';

// load file from os and return it as Future<String>
Future<String> loadAsset(String path) async {
  var myFile = File(path);
  return await myFile.readAsString();
}

// convert String of csv into list
List csvToList(String rawCSVdata) {
  var rowsAsListOfValues =
      const CsvToListConverter().convert(rawCSVdata, eol: '\n');

  return rowsAsListOfValues;
}

// convert csvList to WordModle List
List<WordModel> csvListToWordModelList(List csvData) {
  var wordModelList = <WordModel>[];

  for (var i = 1; i < csvData.length; i++) {
    var word = WordModel.fromList(csvData[i]);
    wordModelList.add(word);
  }
  return wordModelList;
}
