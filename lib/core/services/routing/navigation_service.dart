import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic argument}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: argument);
  }

  //TODO: changed from dynamic to bool
  dynamic goBack() {
    return navigatorKey.currentState.pop();
  }
}
