import 'package:broken_plural_ar/core/common/loggin.dart';
import 'package:broken_plural_ar/core/data/AppData.dart';
import 'package:broken_plural_ar/core/enum/ProviderState.dart';
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

  BaseDatabase _database;

  Future initDatabase() async {
    await Future.delayed(Duration(seconds: 1));
    setState(ProviderState.Busy);

    try {
      await _database.initDB();
      setState(ProviderState.Idel);
    } catch (e) {
      consoleLog(e.toString(), typeLog: "Error");
      setErrorMessage(e.toString());
      setState(ProviderState.Error);
    }
  }
}
