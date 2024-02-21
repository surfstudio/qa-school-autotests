import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final personalDataStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю фамилию$'),
    (context, tester) async {
      await tester.implicitEnterText(personalDataTestScreen.surnameField, 'Рязанцев');
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю имя$'),
    (context, tester) async {
      await tester.implicitEnterText(personalDataTestScreen.firstNameField, 'Александр');
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю отчество$'),
    (context, tester) async {
      await tester.implicitEnterText(personalDataTestScreen.secondNameField, 'Дмитриевич');
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю дату рождения$'),
    (context, tester) async {
      final calendar = tester.widget<TextFormField>(personalDataTestScreen.dateOfBirthField);
      calendar.controller?.text = '1994-03-19';
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу далее$'),
    (context, tester) async {
      await tester.pumpUntilVisible(personalDataTestScreen.trait);
      await tester.implicitTap(generalTestScreen.nextBtn);
      await tester.pumpUntilVisible(residenceTestScreen.trait);
    },
  ),
];
