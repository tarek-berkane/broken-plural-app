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
    return null;
  }

  Future _saveDataToDataBase(csvData) async {
    try {
      CsvToDatabase csvToDatabase = CsvToDatabase(csvData: csvData);
      await csvToDatabase.pushToDatabase(csvData);
      return true;
    } catch (e) {
      consoleLog(e.toString(),
          typeLog: "Error", scope: "SpalshPageProvider > _saveDataToDataBase");
      return false;
    }
  }

  Future loadData() async {
    // TODO: need to find a way to overpass excption of calling setstate during builde
    consoleLog('test 1 check', scope: "loadData", typeLog: 'debug');

    dynamic _csvData = await _loadDataFromCsv();

    if (_csvData == null) {
      setState(ProviderState.Error);
      consoleLog('Data not loaded from csv file _csvData == null',
          typeLog: 'ERROR', scope: "loadData > _loadDataFromCsv");
      return;
    }

    bool _isDataSaveToDB = await _saveDataToDataBase(_csvData);
    if (!_isDataSaveToDB) {
      setState(ProviderState.Error);
      consoleLog('Data not loaded from csv file _isDataSaveToDB != true',
          typeLog: 'ERROR', scope: "SpalshPageProvider >loadData ");
      return;
    }

    _navigateTo(route.HomePage);
  }

  void _navigateTo(String pageName) {
    final NavigationService _navigationService = locator<NavigationService>();
    _navigationService.repalcePage(pageName);
  }
}
