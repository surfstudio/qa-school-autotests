import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final String testBtnText = 'Edit profile';

final mainStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу к редактированию профиля$'),
    (context, tester) async {
      await tester.pumpUntilVisible(mainTestScreen.trait);
      await tester.implicitTap(mainTestScreen.editProfileBtn);
      await tester.pumpUntilVisible(personalDataTestScreen.trait);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я снова перехожу к редактированию профиля$'),
    (context, tester) async {
      await tester.pumpUntilVisible(mainTestScreen.trait);
      await tester.implicitTap(mainTestScreen.editProfileBtn);
      await tester.pumpUntilVisible(personalDataTestScreen.trait);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу на экран редактирования профиля$'),
    (context, tester) async {
      await tester.pumpUntilVisible(mainTestScreen.trait);
      await tester.implicitTap(mainTestScreen.editProfileBtn);
      await tester.pumpUntilVisible(personalDataTestScreen.trait);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Тогда Я проверяю текст кнопки$'),
    (context, tester) async {
      await tester.pumpUntilVisible(mainTestScreen.trait);

      var text =
          mainTestScreen.editProfileBtnText.evaluate().single.widget as Text;
      var textData = text.data;

      expect(textData, testBtnText);
    },
  ),
];
