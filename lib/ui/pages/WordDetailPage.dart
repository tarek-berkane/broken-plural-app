import 'package:broken_plural_ar/core/models/WordModel.dart';
import 'package:flutter/material.dart';

class WordDetailPage extends StatelessWidget {
  final WordModel _wordModel;

  const WordDetailPage(this._wordModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Word Detail Page"),
      ),
      body: Container(
        child: Text('${_wordModel.vocalized}'),
      ),
    );
  }
}
