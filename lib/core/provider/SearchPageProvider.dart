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
  // List<WordModel> similarResults;
  BaseDatabase _database;

  List<WordModel> get getResult => _result;

  // Future<bool> initDatabase() async {
  //   await Future.delayed(Duration(seconds: 1));
  //   // setState(ProviderState.Busy);

  //   try {
  //     // await _database.initDB();
  //     return true;
  //     // setState(ProviderState.Idel);
  //   } catch (e) {
  //     consoleLog(e.toString(), typeLog: "Error");
  //     setErrorMessage(e.toString());
  //     return false;
  //     // setState(ProviderState.Error);
  //   }
  // }

  searchWord(String word) async {
    consoleLog("Searchig the word");
    setState(ProviderState.Busy);
    _result = [];
    // bool databaseLoaded = await initDatabase();

    // if (!databaseLoaded) {
    //   setState(ProviderState.Error);
    //   return;
    // }
    _result = await _database.getWordByString(word);
    setState(ProviderState.Idel);
  }
}
