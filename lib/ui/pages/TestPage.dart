import 'package:broken_plural_ar/core/controller/quiz.dart';
import 'package:broken_plural_ar/core/provider/TestPageProvider.dart';
import 'package:broken_plural_ar/ui/widgets/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionsPage extends StatelessWidget {
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
          builder: (context, child) =>
              // Consumer<TestPageProvider>(
              //   builder: (context, value, child) => Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       RaisedButton(
              //         padding: EdgeInsets.symmetric(
              //           vertical: 10,
              //         ),
              //         child: Text('Start Quiz'),
              //         onPressed: () {},
              //       ),
              //       RaisedButton(
              //         padding: EdgeInsets.symmetric(
              //           vertical: 10,
              //         ),
              //         child: Text('Start Quiz'),
              //         onPressed: () {},
              //       ),
              //       RaisedButton(
              //         padding: EdgeInsets.symmetric(
              //           vertical: 10,
              //         ),
              //         child: Text('Start Quiz'),
              //         onPressed: () {},
              //       ),
              //     ],
              //   ),
              // ),
              BooleanQuiz(),
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
    final _provider = Provider.of<TestPageProvider>(context);
    var state = _provider.getState;
    // print("here");
    if (state == TestProviderState.Init) {
      _provider.init();
      return loadingWidget();
    }

    if (state == TestProviderState.Loading) {
      return loadingWidget();
    }

    if (state == TestProviderState.Testing) {
      _provider.getQuiz();
      return QuizPage();
    }

    if (state == TestProviderState.Result) {
      return ResultPageA();
    }

    return errorWidget();
  }

  Widget loadingWidget() {
    return Center(
      child: Container(
        height: 60,
        width: 60,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget errorWidget() {
    return Center(
      child: Container(
        height: 60,
        width: 60,
        child: Text("Error check your logs"),
      ),
    );
  }
}

class ResultPageA extends StatelessWidget {
  const ResultPageA({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<TestPageProvider>(context);

    return Container(
      child: Column(
        children: [
          Text(_provider.showResult()),
          RaisedButton(
            child: Text("Done"),
            onPressed: () {
              _provider.navigateBack();
            },
          ),
        ],
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool answared = false;
  String correctAnswer;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _provider = Provider.of<TestPageProvider>(context);
    Quiz quiz = _provider.currentQuiz;

    return Container(
      width: _size.width,
      child: Column(
        children: [
          Text(_provider.getQuestion),
          for (var i in _provider.getOptions) answerButton(i, _provider),
          if (!answared)
            Counter(onDone: () {
              onCounterDone(_provider);
            }),
          if (answared)
            RaisedButton(
                child: Text('next one'),
                onPressed: () {
                  _provider.getQuiz();
                  setState(() {
                    answared = false;
                  });
                })
        ],
      ),
    );
  }

  Widget answerButton(String answer, TestPageProvider provider) {
    Color color;

    if (answared) {
      color = correctAnswer == answer ? Colors.green : Colors.red;
    }

    var button = RaisedButton(
      child: Text(answer),
      color: color,
      onPressed: () {
        provider.setResponse(answer);
        setState(() {
          answared = true;
          correctAnswer = provider.getAnswer;
        });
      },
    );

    if (answared) {
      return AbsorbPointer(
        child: button,
      );
    }

    return button;
  }

  void onCounterDone(TestPageProvider provider) {
    provider.setResponse('none');
    setState(() {
      answared = true;
      correctAnswer = provider.getAnswer;
    });
  }
}
