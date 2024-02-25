import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/features/profile/screens/personal_data_screen/widgets/text_form_field_widget.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

// Input data for positive tests
final String surname = 'Riazantsev';
final String firstname = 'Aleksandr';
final String secondname = 'Dmitrievich';
final String dateOfBirth = '1994-03-19';

// Input data for fields validation (additional task #1)
final String surname2 = 'Riazantsev';
final String firstname2 = '';
final String secondname2 = '';
final String dateOfBirth2 = '1994-03-19';

final personalDataStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю фамилию$'),
    (context, tester) async {
      await tester.implicitEnterText(
          personalDataTestScreen.surnameField, surname);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я заполняю фамилию$'),
    (context, tester) async {
      await tester.implicitEnterText(
          personalDataTestScreen.surnameField, surname2);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю имя$'),
    (context, tester) async {
      await tester.implicitEnterText(
          personalDataTestScreen.firstNameField, firstname);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я заполняю имя$'),
    (context, tester) async {
      await tester.implicitEnterText(
          personalDataTestScreen.firstNameField, firstname2);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю отчество$'),
    (context, tester) async {
      await tester.implicitEnterText(
          personalDataTestScreen.secondNameField, secondname);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я заполняю отчество$'),
    (context, tester) async {
      await tester.implicitEnterText(
          personalDataTestScreen.secondNameField, secondname2);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю дату рождения$'),
    (context, tester) async {
      final calendar =
          tester.widget<TextFormField>(personalDataTestScreen.dateOfBirthField);
      calendar.controller?.text = dateOfBirth;
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я заполняю дату рождения$'),
    (context, tester) async {
      final calendar =
          tester.widget<TextFormField>(personalDataTestScreen.dateOfBirthField);
      calendar.controller?.text = dateOfBirth2;
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

      final testSurname = tester
          .widget<TextFormFieldWidget>(personalDataTestScreen.surnameField)
          .controller
          ?.text;
      final testFirstname = tester
          .widget<TextFormFieldWidget>(personalDataTestScreen.firstNameField)
          .controller
          ?.text;
      final testSecondName = tester
          .widget<TextFormFieldWidget>(personalDataTestScreen.secondNameField)
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

      final testDateOfBirth = tester
          .widget<TextFormField>(personalDataTestScreen.dateOfBirthField)
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
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я нажимаю кнопку "Назад" и перехожу на экран заполнения профиля$'),
    (context, tester) async {
      await tester.pumpUntilVisible(personalDataTestScreen.trait);
      await tester.implicitTap(generalTestScreen.backBtn);
      await tester.pumpUntilVisible(mainTestScreen.trait);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я валидирую заполненные поля$'),
    (context, tester) async {
      await tester.pumpUntilVisible(personalDataTestScreen.dateOfBirthField);

      final testSurname = tester
          .widget<TextFormFieldWidget>(personalDataTestScreen.surnameField)
          .controller
          ?.text;
      final testFirstname = tester
          .widget<TextFormFieldWidget>(personalDataTestScreen.firstNameField)
          .controller
          ?.text;
      final testDateOfBirth = tester
          .widget<TextFormField>(personalDataTestScreen.dateOfBirthField)
          .controller
          ?.text;

      String surnameAndFirstnameRegExp = "^[A-ZА-Я][-'a-zA-Z-'а-яА-Я]+\$";
      String dateOfBirthRegExp =
          "^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\$";

      expect(testSurname, matches(RegExp(surnameAndFirstnameRegExp)));
      expect(testFirstname, matches(RegExp(surnameAndFirstnameRegExp)));
      expect(testDateOfBirth, matches(RegExp(dateOfBirthRegExp)));
    },
  ),
];
