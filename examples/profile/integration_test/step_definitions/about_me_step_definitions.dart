import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final String aboutMe = 'https://t.me/ad_riaz';

final aboutMeStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю информацию о себе и сохраняю данные$'),
    (context, tester) async {
      await tester.implicitEnterText(aboutMeTestScreen.textFormField, aboutMe);
      await tester.implicitTap(aboutMeTestScreen.saveBtn);
      await tester.pumpUntilVisible(mainTestScreen.trait);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанную информацию о себе$'),
    (context, tester) async {
      await tester.pumpUntilVisible(aboutMeTestScreen.textFormField);

      final testAboutMe = tester
          .widget<TextFormField>(aboutMeTestScreen.textFormField)
          .controller
          ?.text;

      expect(aboutMe, testAboutMe);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я нажимаю кнопку "Назад" и перехожу на экран интересов$'),
    (context, tester) async {
      await tester.pumpUntilVisible(aboutMeTestScreen.textFormField);
      await tester.implicitTap(generalTestScreen.backBtn);
      await tester.pumpUntilVisible(interestsTestScreen.trait);
    },
  ),
];
