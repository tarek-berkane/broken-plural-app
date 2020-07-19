import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Container(
          // width: 200,
          // height: 150,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      textArea('hello', 'dddd'),
                      textArea('hello', 'dddd'),
                      textArea('hello', 'dddd'),
                    ],
                  ),
                  Column(
                    children: [
                      textArea('helloببببببب', 'dddd'),
                      textArea('hello', 'dddd'),
                      textArea('hello', 'dddd'),
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

  Container textArea(String title, String data) => Container(
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
              child: AutoSizeText(title),
            ),
          ],
        ),
      );
}
