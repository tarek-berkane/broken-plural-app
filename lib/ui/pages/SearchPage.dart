import 'package:broken_plural_ar/core/common/loggin.dart';
import 'package:broken_plural_ar/core/enum/ProviderState.dart';
import 'package:broken_plural_ar/core/models/WordModel.dart';
import 'package:broken_plural_ar/core/provider/SearchPageProvider.dart';
import 'package:broken_plural_ar/ui/widgets/WordCard.dart';
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
        // if you changed the page title don't forget to change it in testing
        title: Text('Search Word'),
      ),
      body: ChangeNotifierProvider<SearchPageProvider>(
        create: (context) => SearchPageProvider(),
        builder: (context, child) {
          return Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SearchArea(),
                ResultArea(),
                // Container(
                //   alignment: Alignment.center,
                //   child: RaisedButton(
                //     child: Text('Search'),
                //     onPressed: () {},
                //   ),
                // )
              ],
            ),
          );
        },
      ),
    );
  }

  Center loadingPage() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class SearchArea extends StatelessWidget {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<SearchPageProvider>(context);

    return Container(
      // width: 450,
      child: Column(
        children: [
          Container(
              // alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text("Search word")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 200,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: 8, right: 8, bottom: 10),
                      hintText: "word",
                      border: OutlineInputBorder()),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Tooltip(
                  message: "Random text",
                  child: Material(
                    elevation: 10.9,
                    shadowColor: Colors.black,
                    color: Colors.blue[900], // button color
                    shape: CircleBorder(),
                    child: InkWell(
                      splashColor: Colors.blueAccent, // inkwell color
                      child: SizedBox(
                          width: 37,
                          height: 37,
                          child: Icon(Icons.refresh, color: Colors.white)),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: RaisedButton(
              child: Text('Search'),
              onPressed: () {
                String text = _controller.text;
                if (text.isNotEmpty) {
                  _provider.searchWord(text);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // showToast(BuildContext context) {
  //   Scaffold.of(context).showSnackBar(SnackBar(
  //     behavior: SnackBarBehavior.floating,
  //     content: Container(
  //       height: 25,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text("hello"),
  //           IconButton(
  //             icon: Icon(Icons.remove),
  //             onPressed: () => removeToast(context),
  //           )
  //         ],
  //       ),
  //     ),
  //     duration: Duration(seconds: 5),
  //   ));
  // }

  // removeToast(BuildContext context) {
  //   Scaffold.of(context).removeCurrentSnackBar();
  // }
}

class ResultArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _provider = context.watch<SearchPageProvider>();

    if (_provider.getState == ProviderState.Busy) {
      return Container(
        child: CircularProgressIndicator(),
      );
    }

    if (_provider.getState == ProviderState.Idel) {
      if (_provider.getResult.isEmpty) {
        return Container(
          child: Text("Empty"),
        );
      }
      consoleLog(_provider.getResult[2].toDict().toString());
      int listLength = _provider.getResult.length;
      consoleLog('$listLength');
      return Expanded(
        child: ListView(
          children: [
            for (int i = 0; i < listLength && i < 10; i++)
              WordCard(
                wordModel: _provider.getResult[i],
              ),
            Container(
              child: Text('heelo'),
            )
          ],
        ),
      );
    }

    return Container(
      child: Text("error"),
    );
  }
}

// class Counter extends StatefulWidget {
//   Counter(this.seconds);
//   final int seconds;
//   @override
//   _CounterState createState() => _CounterState();
// }

// class _CounterState extends State<Counter> {
//   int _time;

//   @override
//   void initState() {
//     super.initState();
//     _time = widget.seconds;
//     assert(_time > 0);
//   }

//   void repateSetState() async {
//     if (_time > 0) {
//       await Future.delayed(Duration(seconds: 1));
//       setState(() {
//         _time--;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     repateSetState();
//     // DateTime _time = DateTime.now();
//     return Container(
//       child: Text(
//         "$_time",
//       ),
//     );
//   }
// }
