import 'package:broken_plural_ar/core/common/loggin.dart';
import 'package:broken_plural_ar/core/data/AppData.dart';
import 'package:broken_plural_ar/core/enum/ProviderState.dart';
import 'package:broken_plural_ar/core/models/WordModel.dart';
import 'package:broken_plural_ar/core/provider/BaseProvider.dart';
import 'package:broken_plural_ar/core/services/database/BaseDatabase.dart';
import 'package:broken_plural_ar/core/services/database/FakeDatabase.dart';
import 'package:broken_plural_ar/core/services/database/RealDatabase.dart';

class SearchPageProvider extends BaseProvider {
  SearchPageProvider() {
    if (AppData.appState == AppState.Production) {
      _database = RealDatabase.db;
    } else {
      _database = FakeDatabase.db;
    }
  }

  List<WordModel> _result = [];

  BaseDatabase _database;

  List<WordModel> get getResult => _result;

  searchWord(String word) async {
    consoleLog("Searchig the word");
    setState(ProviderState.Busy);
    // wait untile widget rebuild
    await Future.delayed(Duration(milliseconds: 50));
    _result = [];

    _result = await _database.getWordByString(word);
    setState(ProviderState.Idel);
  }
}
