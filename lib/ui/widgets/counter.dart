import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  Counter({@required this.onDone, Key key}) : super(key: key);

  Function() onDone;
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  var isDone = false;
  int time = 20;

  @override
  Widget build(BuildContext context) {
    // counter();
    return StreamBuilder<int>(
        stream: lines(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return Container();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }
          if (snapshot.hasData) {
            return Container(
              width: 300,
              child: LinearProgressIndicator(
                value: snapshot.data / 20,
                backgroundColor: Colors.grey,
              ),
            );
          }
        });
  }

  Future<void> counter() async {
    if (isDone) return;

    if (time <= 0) {
      isDone = true;
      await Future.delayed(Duration(seconds: 1));
      widget.onDone();
      return;
    }

    await Future.delayed(Duration(seconds: 1));
    setState(() {
      time--;
    });
  }

  @override
  void dispose() {
    isDone = true;
    super.dispose();
  }

  Stream<int> lines() async* {
    // Stores any partial line from the previous chunk.
    // Wait until a new chunk is available, then process it.
    yield time;
    while (time > 0) {
      time--;
      await Future.delayed(Duration(seconds: 1));
      yield time; // Add lines to output stream.
    }

    await Future.delayed(Duration(seconds: 1));
    widget.onDone();

    yield 0;
  }
}
