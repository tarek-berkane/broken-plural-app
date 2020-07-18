import 'package:broken_plural_ar/ui/pages/AboutPage.dart';
import 'package:broken_plural_ar/ui/pages/SearchPage.dart';
import 'package:broken_plural_ar/ui/pages/SplashPage.dart';
import 'package:flutter/material.dart';

import 'package:broken_plural_ar/core/services/routing/navigation_service.dart';
import 'package:broken_plural_ar/core/data/RouteName.dart' as routes;
import 'package:broken_plural_ar/route.dart' as router;
import 'package:broken_plural_ar/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
      initialRoute: routes.SplashPage,
      home: SplashPage(),
    );
  }
}
