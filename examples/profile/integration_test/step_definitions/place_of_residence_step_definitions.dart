import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final placeOfResidenceStepDefinitions = [
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу экран заполнения города$'),
        (context, tester) async {
      await tester.pumpUntilVisible(placeOfResidenceTestScreen.residenceScreen);
      expect(placeOfResidenceTestScreen.residenceScreen, findsOneWidget);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я выбираю город из списка$'),
        (context, tester) async {
      await tester.implicitEnterText(placeOfResidenceTestScreen.residenceField, "Voronezh");
      await tester.implicitTap(placeOfResidenceTestScreen.listOfCities.first);
    },
  ),
  /// конструкция для поиска текста наэкране который мы ввели ранее
  // testerWhen<FlutterWidgetTesterWorld>(
  //   RegExp(r'Я вижу указанный город$'),
  //       (context, tester) async {
  //     await tester.pumpUntilVisible(personalDataTestScreen.cityField);
  //     final city = tester.widget<TextField>(personalDataTestScreen.cityField).controller?.text;
  //     expect(city, "Voronezh");
  //   },
  // ),

];
