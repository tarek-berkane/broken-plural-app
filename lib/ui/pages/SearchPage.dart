import 'package:broken_plural_ar/core/provider/SearchPageProvider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  onbuttonPressed() {
    // _csvLoadManager.loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Word'),
      ),
      body: ChangeNotifierProvider<SearchPageProvider>(
        create: (context) => SearchPageProvider(),
        builder: (context, child) => Consumer<SearchPageProvider>(
          builder: (context, value, child) {
            return Center(
              child: Text("Done"),
            );
          },
        ),
      ),
    );
  }

  Center loadingPage() {
    return Center(
      child: CircularProgressIndicator(),
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
        "$_time",
      ),
    );
  }
}
