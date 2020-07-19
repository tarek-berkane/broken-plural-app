import 'package:auto_size_text/auto_size_text.dart';
import 'package:broken_plural_ar/core/models/WordModel.dart';
import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  const WordCard({@required this.wordModel});
  final WordModel wordModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // TODO: navigate to about word page
        },
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      textArea('vocalized', wordModel.vocalized),
                      textArea('unvocalized', wordModel.unvocalized),
                      textArea('wordtype', wordModel.wordtype),
                      textArea('root', wordModel.root),
                    ],
                  ),
                  Column(
                    children: [
                      textArea('wazn', wordModel.wazn),
                      textArea('category', wordModel.category),
                      textArea('gender', wordModel.gender),
                      textArea('broken_plural', wordModel.brokenPlural),
                    ],
                  ),
                ],
              ),
              Container(
                child: Text("click to load more"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container textArea(String title, String data) {
    if (data == null) {
      data = ' ';
    }
    return Container(
      child: Row(
        children: [
          Container(
            width: 50,
            height: 20,
            child: AutoSizeText(title),
          ),
          Container(
            width: 50,
            height: 20,
            child: AutoSizeText(data),
          ),
        ],
      ),
    );
  }
}
