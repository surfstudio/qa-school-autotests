import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../../test_screen/screens/main_test_screen.dart';
import '../../test_screen/screens/profile_test_screen.dart';

abstract class ProfileStepDefinitions {
  static StepDefinitionGeneric nextButton = when<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу далее$'),
    (context) async {
      final tester = context.world.rawAppDriver;
      await tester.tap(ProfileTestScreen.nextButton);
      await tester.pumpAndSettle();
    },
  );

  static Iterable<StepDefinitionGeneric> get steps => [
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я указываю фамилию {string}$'),
          (surname, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            await tester.enterText(ProfileTestScreen.surnameField, surname);
            await tester.pump();
          },
        ),
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я указываю имя {string}$'),
          (name, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            await tester.enterText(ProfileTestScreen.nameField, name);
            await tester.pump();
          },
        ),
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я указываю отчество {string}$'),
          (secondName, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            await tester.enterText(
              ProfileTestScreen.secondNameField,
              secondName,
            );
            await tester.pump();
          },
        ),
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я указываю дату рождения {string}$'),
          (birthdate, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            tester
                .widget<TextField>(ProfileTestScreen.birthdayField)
                .controller
                ?.text = birthdate;
            await tester.pump();
          },
        ),
        nextButton,
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я выбираю город {string}$'),
          (city, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            tester
                .widget<TextField>(ProfileTestScreen.cityField)
                .controller
                ?.text = city;
            await tester.pump();
          },
        ),
        nextButton,
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я выбираю {string} из интересов$'),
          (selectedCheckbox, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            await tester.scrollUntilVisible(
              ProfileTestScreen.checkbox(selectedCheckbox),
              100,
            );
            await tester.tap(ProfileTestScreen.checkbox(selectedCheckbox));
            await tester.pump();
          },
        ),
        nextButton,
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я заполняю заметку о себе {string}$'),
          (note, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            await tester.enterText(
              ProfileTestScreen.noteField,
              note,
            );
            await tester.pump();
          },
        ),
        when<FlutterWidgetTesterWorld>(
          RegExp(r'Я сохраняю данные$'),
          (context) async {
            final tester = context.world.rawAppDriver;
            await tester.tap(ProfileTestScreen.saveButton);
            await tester.pumpAndSettle();
          },
        ),
         when<FlutterWidgetTesterWorld>(
          RegExp(r'Я перехожу к редактированию профиля$'),
          (context) async {
            final tester = context.world.rawAppDriver;
            await tester.tap(MainTestScreen.editProfileBtn);
          },
        ),
        then<FlutterWidgetTesterWorld>(
          RegExp(r'$'),
          (context) async {
            final tester = context.world.rawAppDriver;
            final fields = tester.widgetList<TextField>(find.byType(TextField));
            expect(fields.every((e) => e.controller?.text.isNotEmpty ?? false), isTrue);
          },
        ),
      ];
}
