import 'package:broken_plural_ar/core/common/loggin.dart';
import 'package:broken_plural_ar/core/enum/ProviderState.dart';
import 'package:broken_plural_ar/core/provider/BaseProvider.dart';
import 'package:broken_plural_ar/core/services/routing/navigation_service.dart';
import 'package:broken_plural_ar/core/utils/CsvLoadManager.dart';
import 'package:broken_plural_ar/core/utils/CsvToDatabase.dart';
import 'package:broken_plural_ar/locator.dart';

import 'package:broken_plural_ar/core/data/RouteName.dart' as route;

class SpalshPageProvider extends BaseProvider {
  Future<dynamic> _loadDataFromCsv() async {
    CsvLoadManager _csvLoadManager = CsvLoadManager();
    if (await _csvLoadManager.loadCSV()) {
      return _csvLoadManager.csvList;
    }
    setState(ProviderState.Error);
    return null;
  }

  Future _saveDataToDataBase(csvData) async {
    try {
      CsvToDatabase csvToDatabase = CsvToDatabase(csvData: csvData);
      await csvToDatabase.pushToDatabase(csvData);
      return true;
    } catch (e) {
      consoleLog(e.toString(), typeLog: "Error", scope: "_saveDataToDataBase");
      return false;
    }
  }

  void _navigateTo(String pageName) {
    final NavigationService _navigationService = locator<NavigationService>();
    _navigationService.repalcePage(pageName);
  }

  Future loadData() async {
    await Future.delayed(Duration(seconds: 1));
    dynamic _csvData = await _loadDataFromCsv();
    if (_csvData == null) {
      setState(ProviderState.Error);
      consoleLog('Data not loaded from csv file',
          typeLog: 'ERROR', scope: "loadData > _loadDataFromCsv");
      return;
    }

    bool _isDataSaveToDB = await _saveDataToDataBase(_csvData);
    if (!_isDataSaveToDB) {
      setState(ProviderState.Error);
      consoleLog('Data not loaded from csv file',
          typeLog: 'ERROR', scope: "loadData > _saveDataToDataBase");
      return;
    }

    _navigateTo(route.HomePage);
  }
}
