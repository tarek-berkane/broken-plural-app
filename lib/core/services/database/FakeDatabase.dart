import 'package:broken_plural_ar/core/services/database/BaseDatabase.dart';
import 'package:broken_plural_ar/core/models/WordModel.dart';

import 'package:sqflite_common/sqlite_api.dart';

/** just for [Testing] */

class FakeDatabase extends BaseDatabase {
  FakeDatabase._();

  static final db = FakeDatabase._();

  Map fakeDatabaseStorage = null;

  @override
  // TODO: implement database
  Future<Database> get database => throw UnimplementedError();

  @override
  initDB() {
    fakeDatabaseStorage = {};
  }

  @override
  getWordById(int id) {
    return fakeDatabaseStorage[id];
  }

  @override
  getWordByString(String word) {
    // TODO: implement getClient
    throw UnimplementedError();
  }

  @override
  Future<List<WordModels>> getAllClients({int start = 0, int limit = 25}) {
    List<WordModels> wordModelsList = [];
    for (var i = start; i < limit; i++) {
      wordModelsList.add(WordModels.fromDict(fakeDatabaseStorage[i]));
    }
    throw UnimplementedError();
  }

  @override
  newWord(WordModels newWord) {
    // TODO: implement newClient
    throw UnimplementedError();
  }
}
