import 'package:broken_plural_ar/core/models/WordModel.dart';

class Quiz {
  Quiz(this._wordModel);
  final WordModel _wordModel;
  String _attempt;
  String get question =>
      'what is the vocalized of ${_wordModel.root} ${_wordModel.vocalized}';

  String get getAnswer => _wordModel.vocalized;

  List<String> get getOptions => [_wordModel.vocalized, _wordModel.root];

  set setReponse(reponse) => _attempt = reponse;

  bool isCorrect() {
    if (_attempt == null) return false;
    return _attempt == _wordModel.vocalized;
  }
}
