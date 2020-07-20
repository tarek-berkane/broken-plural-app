import 'package:broken_plural_ar/core/common/loggin.dart';
import 'package:broken_plural_ar/core/enum/ProviderState.dart';
import 'package:broken_plural_ar/core/provider/HomePageProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:broken_plural_ar/core/data/RouteName.dart' as routes;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // if you changed the page title don't forget to change it in testing
        title: Text("Home Page"),
      ),
      body: ChangeNotifierProvider<HomePageProvider>(
        create: (context) => HomePageProvider(),
        builder: (context, child) => Consumer<HomePageProvider>(
          builder: (context, value, child) {
            consoleLog(value.getState.toString());
            if (value.getState == ProviderState.Busy) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container(
              child: Column(
                children: [
                  navigateButton('Learn Page', () {
                    value.navigateTo(routes.LearnPage);
                  }),
                  navigateButton('Search Page', () {
                    value.navigateTo(routes.SearchPage);
                  }),
                  navigateButton('Test Page', () {
                    value.navigateTo(routes.TestPage);
                  }),
                  navigateButton('About Page', () {
                    value.navigateTo(routes.AboutPage);
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  RaisedButton navigateButton(String text, Function onPressed) {
    return RaisedButton(
      child: Text(text),
      onPressed: onPressed,
    );
  }
}
