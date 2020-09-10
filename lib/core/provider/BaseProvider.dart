import 'package:flutter/foundation.dart';

import 'package:broken_plural_ar/core/enum/ProviderState.dart';

class BaseProvider extends ChangeNotifier {
  ProviderState _state = ProviderState.Idel;
  String _errorMessage;

  get getState => _state;
  get errorMessage => _errorMessage;

  void setState(ProviderState providerState) {
    _state = providerState;
    notifyListeners();
  }

  void setErrorMessage(String message) {
    _errorMessage = message;
    // notifyListeners();
  }
}
