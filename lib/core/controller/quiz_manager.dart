import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:broken_plural_ar/core/controller/quiz.dart';
import 'package:broken_plural_ar/core/models/WordModel.dart';

class QuizManager {
  QuizManager(this.wordModelList);
  List<WordModel> wordModelList;
  List<Quiz> quizList = <Quiz>[];
  List<int> noteList;
  final _random = Random();

  void start() {
    // init question [Done]
    initQuestion();
    // init noteList
    initNoteList();
    // iterate over the question
    for (var i = 0; i < quizList.length; i++) {
      print(quizList[i].question);
      var line = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
      quizList[i].setReponse = line;

      noteList[i] = (quizList[i].isCorrect) ? 1 : 0;
      print(noteList[i]);
    }
    // show result
    showResult();
  }

  void initQuestion() {
    for (var i = 0; i < 3; i++) {
      var wordModel = wordModelList[_random.nextInt(wordModelList.length)];
      quizList.add(Quiz(wordModel));
    }
  }

  void initNoteList() {
    noteList = List(quizList.length);
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
}
