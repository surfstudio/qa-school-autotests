import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final residenceStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я выбираю город$'),
    (context, tester) async {
      final String testCity = 'Voronezh';
      await tester.implicitEnterText(residenceTestScreen.placeField, testCity);
      final listElement = residenceTestScreen.suggestionWidget(testCity);
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
];
