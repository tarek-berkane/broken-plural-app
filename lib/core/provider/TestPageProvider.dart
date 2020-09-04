import 'dart:math';

import 'package:broken_plural_ar/core/controller/quiz.dart';
import 'package:broken_plural_ar/core/controller/quiz_manager.dart';
import 'package:broken_plural_ar/core/data/AppData.dart';
import 'package:broken_plural_ar/core/services/database/BaseDatabase.dart';
import 'package:broken_plural_ar/core/services/database/FakeDatabase.dart';
import 'package:broken_plural_ar/core/services/database/RealDatabase.dart';
import 'package:broken_plural_ar/core/services/routing/navigation_service.dart';
import 'package:broken_plural_ar/locator.dart';
import 'package:flutter/material.dart';
import 'package:broken_plural_ar/core/data/RouteName.dart' as routes;

// enum QuizeState { , WriteTest, ChoiceTest }

class TestPageProvider extends ChangeNotifier {
  BaseDatabase _database;
  Iterator _quizItrator;

  final _navigationService = locator<NavigationService>();
  var quizList = List<Quiz>(3);
  var noteList = List<int>(3);
  var currentQuiz;

  // init the class
  void init() async {
    try {
      await initQuestion();
      _quizItrator = getQuestionItrator().iterator;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  void startQuiz() async {
    if (_quizItrator.moveNext()) {
      currentQuiz = _quizItrator.current;
    }
    // TODO:navigate To result Page
    _navigationService.repalcePage(routes.ResultPage, argument: noteList);
  }

  // retrieve random questions from database
  initQuestion() async {
    List wordModelList = await _database.getRandomWord(3);
    for (var i = 0; i < 3; i++) {
      quizList.add(Quiz(wordModelList[i]));
    }
  }

  // make question itarable
  Iterable getQuestionItrator() sync* {
    for (var quiz in quizList) {
      yield quiz;
    }
  }

  void showResult() {
    int correctAnswer = 0, falseAnswer;

    for (var i in noteList) {
      if (i == 1) correctAnswer++;
    }

    falseAnswer = noteList.length - correctAnswer;
    print(
        'you answared $correctAnswer correct and $falseAnswer false bravo');
  }

  // Constructors
  TestPageProvider() {
    if (AppData.appState == AppState.Production) {
      _database = RealDatabase.db;
    } else {
      _database = FakeDatabase.db;
    }
  }
}
