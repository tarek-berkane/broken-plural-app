import 'package:broken_plural_ar/locator.dart';
import 'package:broken_plural_ar/ui/pages/HomePage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:broken_plural_ar/core/services/routing/navigation_service.dart';
import 'package:broken_plural_ar/core/data/RouteName.dart' as routes;
import 'package:broken_plural_ar/route.dart' as router;

String colorText(String text) {
  text = "\x1b[33m" + text + "\x1b[37m";
  return text;
}

void main() {
  testWidgets('testing navigation HomePage', (WidgetTester tester) async {
    setupLocator();
    await tester.pumpWidget(MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
        initialRoute: routes.HomePage,
        home: HomePage()));

    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pushNamed(routes.HomePage);
    await tester.pumpAndSettle();

    expect(find.text('Home Page'), findsOneWidget);

    navigator.pushNamed(routes.SearchPage);
    await tester.pumpAndSettle();

    expect(find.text('Search Word'), findsOneWidget);

    navigator.pushNamed(routes.AboutPage);
    await tester.pumpAndSettle();

    expect(find.text('About Page'), findsOneWidget);

    navigator.pushNamed(routes.LearnPage);
    await tester.pumpAndSettle();

    expect(find.text('learn Page'), findsOneWidget);
  });
}
