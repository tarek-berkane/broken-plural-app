import 'package:broken_plural_ar/core/models/WordModel.dart';

class Quiz {
  Quiz(this._wordModel);
  final WordModel _wordModel;
  var _attempt;

  String get question =>
      'what is the vocalized of ${_wordModel.root} ${_wordModel.vocalized}';

  set setReponse(reponse) => _attempt = reponse;

  bool get isCorrect => _attempt == _wordModel.vocalized;
}
