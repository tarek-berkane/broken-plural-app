abstract class QuizModel {
  String _question;
  String _answear;
  List<String> _choices;
  String _attempt;

  String get getAnswear => _answear;
  String get getQuestion => _question;
  List<String> get getChoices => _choices;

  set setAttempt(String attempt) => _attempt = attempt;

  bool attemptValidation();

  // loading data from WordModel
  void loadData();
}
