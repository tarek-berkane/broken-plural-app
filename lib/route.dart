import 'package:broken_plural_ar/ui/pages/AboutPage.dart';
import 'package:broken_plural_ar/ui/pages/SplashPage.dart';
import 'package:broken_plural_ar/ui/pages/TestPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:broken_plural_ar/core/data/RouteName.dart' as routes;

// import pages
import 'package:broken_plural_ar/ui/pages/HomePage.dart';
import 'package:broken_plural_ar/ui/pages/LearnPage.dart';
import 'package:broken_plural_ar/ui/pages/SearchPage.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.HomePage:
      return MaterialPageRoute(builder: (context) => HomePage());
    case routes.LearnPage:
      return MaterialPageRoute(builder: (context) => LearnPage());
    case routes.SearchPage:
      return MaterialPageRoute(builder: (context) => SearchPage());
    case routes.TestPage:
      return MaterialPageRoute(builder: (context) => TestPage());

    case routes.SplashPage:
      return MaterialPageRoute(builder: (context) => SplashPage());
    case routes.AboutPage:
      return MaterialPageRoute(builder: (context) => AboutPage());

    // TODO ADD argments
    // case routes.HomePage:
    //   var userName = settings.arguments as String;
    //   return MaterialPageRoute(
    //       builder: (context) => HomePage(userName: userName));
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}