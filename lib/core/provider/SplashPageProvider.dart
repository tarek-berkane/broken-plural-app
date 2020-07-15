import 'package:broken_plural_ar/core/data/AppData.dart';
import 'package:broken_plural_ar/core/enum/ProviderState.dart';
import 'package:broken_plural_ar/core/provider/BaseProvider.dart';
import 'package:broken_plural_ar/core/services/database/BaseDatabase.dart';
import 'package:broken_plural_ar/core/services/database/FakeDatabase.dart';
import 'package:broken_plural_ar/core/services/database/RealDatabase.dart';
import 'package:broken_plural_ar/core/utils/CsvLoadManager.dart';
import 'package:broken_plural_ar/core/utils/CsvToDatabase.dart';

class SpalshPageProvider extends BaseProvider {
  SplashPageProvider() {
    if (AppData.appState == AppState.Production) {
      _database = RealDatabase.db;
    } else {
      _database = FakeDatabase.db;
    }
  }

  BaseDatabase _database;

  void loadData() async {
    setState(ProviderState.Busy);
    CsvLoadManager _csvLoadManager = CsvLoadManager();
    if (!_csvLoadManager.loadCSV()) {
      setState(ProviderState.Error);
      return;
    }

    setState(ProviderState.Idel);
  }

  void saveDataToDataBase(csvData) {
    CsvToDatabase csvToDatabase = CsvToDatabase(csvData: csvData);
    csvToDatabase.pushToDatabase(csvData);
  }

  void navigateTo() {}
}
