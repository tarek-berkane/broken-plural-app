import 'package:broken_plural_ar/core/models/WordModel.dart';
import 'package:broken_plural_ar/core/services/database/BaseDatabase.dart';
import 'package:sqflite_common/sqlite_api.dart';

class RealDatabase extends BaseDatabase {
  RealDatabase._();

  static final db = RealDatabase._();

  @override
  // TODO: implement database
  Future<Database> get database => throw UnimplementedError();

  @override
  initDB() {
    // TODO: implement initDB
    throw UnimplementedError();
  }

  @override
  getWordById(int id) {
    // TODO: implement getClient
    throw UnimplementedError();
  }

  @override
  getWordByString(String word) {
    // TODO: implement getClient
    throw UnimplementedError();
  }

  @override
  Future<List<WordModel>> getAllClients({int limit = 25}) {
    // TODO: implement getAllClients
    throw UnimplementedError();
  }

  @override
  Future<bool> newWords(List<List<dynamic>> listOfWords) {
    // TODO: implement newClient
    throw UnimplementedError();
  }
}
