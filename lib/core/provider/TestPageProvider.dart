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

enum TestProviderState { Init, Loading, Testing, Result, Error }

class TestPageProvider extends ChangeNotifier {
  TestProviderState _state = TestProviderState.Init;
  BaseDatabase _database;

  Iterator _quizItrator;

  final _navigationService = locator<NavigationService>();

  var quizList = List<Quiz>(3);
  var noteList = List<bool>();
  Quiz currentQuiz;
  bool currentNote;

  // Functions

  setState(TestProviderState state) {
    _state = state;
    notifyListeners();
  }

  TestProviderState get getState => _state;

  // init the class
  void init() async {
    print("here");
    try {
      await initQuestion();
      // _quizItrator = getQuestionItrator().iterator;
      _quizItrator = quizList.iterator;
      // _noteItrator = noteList.iterator;
    } catch (e) {
      print(e);
      rethrow;
    }
    setState(TestProviderState.Testing);
  }

  void getQuiz() async {
    if (_quizItrator.moveNext()) {
      currentQuiz = _quizItrator.current;
      return;
    }

    setState(TestProviderState.Result);
  }

  // retrieve random questions from database
  initQuestion() async {
    List wordModelList = await _database.getRandomWord(3);
    for (var i = 0; i < 3; i++) {
      quizList[i] = Quiz(wordModelList[i]);
    }
  }

  // TODO Edit this function
  String showResult() {
    int correctAnswer = 0, falseAnswer;

    for (var i in noteList) {
      if (i) correctAnswer++;
    }

    falseAnswer = noteList.length - correctAnswer;
    // print(
    return 'you answared $correctAnswer correct and $falseAnswer false bravo';
  }

  // Constructors
  TestPageProvider() {
    if (AppData.appState == AppState.Production) {
      _database = RealDatabase.db;
    } else {
      _database = FakeDatabase.db;
    }
  }

  // Quiz Controler

  setResponse(String text) {
    currentQuiz.setReponse = text;
    noteList.add(currentQuiz.isCorrect());
    print(currentNote);
  }

  get getQuestion => currentQuiz.question;

  get getResult => currentQuiz.isCorrect();

  get getAnswer => currentQuiz.getAnswer;

  get getOptions => currentQuiz.getOptions;

// Navigation
  Future navigateBack() async {
    await _navigationService.goBack();
  }
}
