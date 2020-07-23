import 'dart:math';

import 'package:flutter/material.dart';

enum TestType { BoolTest, WriteTest, ChoiceTest }

class TestPageProvider extends ChangeNotifier {
  // generate types and order of tests
  List getTests() {
    final _random = new Random();
    List typesa = TestType.values;
    List testType = [];
    for (var i = 0; i < 8; i++) {
      testType.add(typesa[_random.nextInt(typesa.length)]);
    }
    return testType;
  }
}
