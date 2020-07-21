import 'package:broken_plural_ar/core/enum/ProviderState.dart';
import 'package:broken_plural_ar/core/provider/SplashPageProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<SpalshPageProvider>(
        create: (context) => SpalshPageProvider(),
        builder: (context, child) => Consumer<SpalshPageProvider>(
          builder: (context, value, child) {
            if (value.getState == ProviderState.Idel) {
              value.loadData();
              return child;
            }

            return Center(
              child: Text("Some error happen"),
            );
          },
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  // Future loadData(provider) {}
}
