import 'package:broken_plural_ar/core/provider/TestPageProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ChangeNotifierProvider(
          create: (context) => TestPageProvider(),
          builder: (context, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text('Start Quiz'),
                onPressed: () {},
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text('Start Quiz'),
                onPressed: () {},
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text('Start Quiz'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BooleanQuiz extends StatefulWidget {
  BooleanQuiz({Key key}) : super(key: key);

  @override
  _BooleanQuizState createState() => _BooleanQuizState();
}

class _BooleanQuizState extends State<BooleanQuiz> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Boolean Quiz"),
    );
  }
}
