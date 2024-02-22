import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/features/profile/screens/personal_data_screen/widgets/text_form_field_widget.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final String surname = 'Riazantsev';
final String firstname = 'Aleksandr';
final String secondname = 'Dmitrievich';
final String dateOfBirth = '1994-03-19';

final personalDataStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю фамилию$'),
    (context, tester) async {
      await tester.implicitEnterText(personalDataTestScreen.surnameField, surname);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю имя$'),
    (context, tester) async {
      await tester.implicitEnterText(personalDataTestScreen.firstNameField, firstname);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю отчество$'),
    (context, tester) async {
      await tester.implicitEnterText(personalDataTestScreen.secondNameField, secondname);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю дату рождения$'),
    (context, tester) async {
      final calendar = tester.widget<TextFormField>(personalDataTestScreen.dateOfBirthField);
      calendar.controller?.text = dateOfBirth;
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу далее для выбора города$'),
    (context, tester) async {
      await tester.pumpUntilVisible(personalDataTestScreen.trait);
      await tester.implicitTap(generalTestScreen.nextBtn);
      await tester.pumpUntilVisible(residenceTestScreen.trait);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанные ФИО$'),
    (context, tester) async {
      await tester.pumpUntilVisible(personalDataTestScreen.surnameField);

      final testSurname = tester.widget<TextFormFieldWidget>(personalDataTestScreen.surnameField)
          .controller
          ?.text;
      final testFirstname = tester.widget<TextFormFieldWidget>(personalDataTestScreen.firstNameField)
          .controller
          ?.text;
      final testSecondName = tester.widget<TextFormFieldWidget>(personalDataTestScreen.secondNameField)
          .controller
          ?.text;

      expect(testSurname, surname);
      expect(testFirstname, firstname);
      expect(testSecondName, secondname);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанную дату рождения$'),
        (context, tester) async {
      await tester.pumpUntilVisible(personalDataTestScreen.dateOfBirthField);

      final testDateOfBirth = tester.widget<TextFormField>(personalDataTestScreen.dateOfBirthField)
          .controller
          ?.text;

      expect(testDateOfBirth, dateOfBirth);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу далее для проверки города$'),
        (context, tester) async {
      await tester.pumpUntilVisible(personalDataTestScreen.trait);
      await tester.implicitTap(generalTestScreen.nextBtn);
      await tester.pumpUntilVisible(residenceTestScreen.trait);
    },
  ),
];
