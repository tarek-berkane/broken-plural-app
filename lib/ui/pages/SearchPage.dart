import 'package:broken_plural_ar/core/common/loggin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:broken_plural_ar/core/utils/CsvLoadManager.dart';

class SearchPage extends StatelessWidget {
  CsvLoadManager _csvLoadManager = CsvLoadManager();

  onbuttonPressed() {
    _csvLoadManager.loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Word'),
      ),
      body: Center(
        child: Center(
          child: RaisedButton(
            child: Text("Test"),
            onPressed: onbuttonPressed,
          ),
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  Counter(this.seconds);
  final int seconds;
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _time;

  @override
  void initState() {
    super.initState();
    _time = widget.seconds;
    assert(_time > 0);
  }

  void repateSetState() async {
    if (_time > 0) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        _time--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    repateSetState();
    // DateTime _time = DateTime.now();
    return Container(
      child: Text(
        "${_time}",
      ),
      // "${_time.minute.toString().padLeft(2, "0")}:${_time.second.toString().padLeft(2, "0")}"),
    );
  }
}
