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
            return Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SearchArea(),
                  Container(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      child: Text('Search'),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
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

class SearchArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
