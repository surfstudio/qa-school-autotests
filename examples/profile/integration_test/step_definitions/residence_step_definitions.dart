import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final String city = 'Voronezh';

final residenceStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я выбираю город$'),
    (context, tester) async {
      await tester.implicitEnterText(residenceTestScreen.placeField, city);
      final listElement = residenceTestScreen.suggestionWidget(city);
      await tester.implicitTap(listElement);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу далее на список интересов$'),
    (context, tester) async {
      await tester.pumpUntilVisible(residenceTestScreen.trait);
      await tester.implicitTap(generalTestScreen.nextBtn);
      await tester.pumpUntilVisible(interestsTestScreen.trait);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанный город$'),
    (context, tester) async {
      await tester.pumpUntilVisible(residenceTestScreen.placeField);

      final testCity = tester.widget<TextFormField>(residenceTestScreen.placeField)
          .controller
          ?.text;

      expect(testCity, city);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу далее для проверки интересов$'),
    (context, tester) async {
      await tester.pumpUntilVisible(residenceTestScreen.trait);
      await tester.implicitTap(generalTestScreen.nextBtn);
      await tester.pumpUntilVisible(interestsTestScreen.trait);
    },
  ),
];
