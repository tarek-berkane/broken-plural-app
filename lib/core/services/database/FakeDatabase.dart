import 'dart:math';

import 'package:broken_plural_ar/core/common/loggin.dart';
import 'package:broken_plural_ar/core/services/database/BaseDatabase.dart';
import 'package:broken_plural_ar/core/models/WordModel.dart';

import 'package:sqflite_common/sqlite_api.dart';

/// just for [Testing]

class FakeDatabase extends BaseDatabase {
  FakeDatabase._();

  static final db = FakeDatabase._();

  List<Map> fakeDatabaseStorage;

  @override
  // TODO: implement database
  Future<Database> get database => throw UnimplementedError();

  @override
  initDB() async {
    fakeDatabaseStorage = [];
    return Future.value(true);
  }

  @override
  getWordById(int id) {
    // TODO Implement this function
    return fakeDatabaseStorage[0][id];
  }

  @override
  Future<List<WordModel>> getWordByString(String word) {
    List<WordModel> data = [];

    consoleLog("${fakeDatabaseStorage.length}",
        scope: "FakeDatabase > getWordByString");

    for (var i = 0; i < fakeDatabaseStorage.length; i++) {
      if (fakeDatabaseStorage[i]['vocalized'].contains(word) ||
          fakeDatabaseStorage[i]['unvocalized'].contains(word)) {
        data.add(WordModel.fromDict(fakeDatabaseStorage[i]));
      }
    }
    return Future.value(data);
  }

  @override
  Future<List<WordModel>> getAllClients({int start = 0, int limit = 25}) {
    List<WordModel> wordModelsList = [];
    for (var i = start; i < limit; i++) {
      wordModelsList.add(WordModel.fromDict(fakeDatabaseStorage[i]));
    }
    return Future.value(wordModelsList);
  }

  @override
  Future<bool> newWords(List<List<dynamic>> listOfWords) {
    //  add data to fakeDatabaseStore just in Debug Mode in
    //  production mode this data need to be stored in database

    for (var i = 1; i < listOfWords.length; i++) {
      fakeDatabaseStorage.add({
        "id": listOfWords[i][0],
        "vocalized": listOfWords[i][1],
        "unvocalized": listOfWords[i][2],
        "wordtype": listOfWords[i][3],
        "root": listOfWords[i][4],
        "wazn": listOfWords[i][5],
        "category": listOfWords[i][6],
        "gender": listOfWords[i][7],
        "feminin": listOfWords[i][8],
        "masculin": listOfWords[i][9],
        "broken_plural": listOfWords[i][10],
        "feminable": listOfWords[i][11],
        "masculin_plural": listOfWords[i][12],
        "feminin_plural": listOfWords[i][13],
        "mamnou3_sarf": listOfWords[i][14],
        "relative": listOfWords[i][15],
        "plural_tanwin_nasb": listOfWords[i][16],
      });
    }
    return Future.value(true);
  }

  // Load Random Word from DataBase
  // retrun  List<Model> with size from [length]
  Future<List<WordModel>> getRandomWord(int length) async {
    assert(length < fakeDatabaseStorage.length);
    final _random = Random();
    var wordModelList = <WordModel>[];
    var dataBaseLength = fakeDatabaseStorage.length;

    for (var i = 0; i < length; i++) {
      var dataBaseItem =
          fakeDatabaseStorage[_random.nextInt(dataBaseLength)];
      var wordMode = WordModel.fromDict(dataBaseItem);
      wordModelList.add(wordMode);
    }
    await Future.delayed(Duration(milliseconds: 300));
    return wordModelList;
  }
}
