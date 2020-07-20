// import 'package:flutter_driver/flutter_driver.dart';
// import 'package:test/test.dart';

// void main() {
//   group("Home Page Testing", () {
//     FlutterDriver driver;
//     setUpAll(() async {
//       driver = await FlutterDriver.connect();
//     });

//     tearDownAll(() async {
//       if (driver != null) {
//         driver.close();
//       }
//     });

//     test('load Home Page', () async {
//       await Future.delayed(Duration(seconds: 3));
//       final homePageText = find.text('Home Page');
//       expect(await driver.getText(homePageText), 'Home Page');
//     });
//   });
// }
