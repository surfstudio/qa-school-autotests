import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/features/profile/widgets/next_button.dart';

import 'general_test_screen.dart';

abstract class ProfileTestScreen {
  /// поле Surname на экране персональных данных
  static Finder surnameField = GeneralTestScreen.textField('Surname');

  /// поле Name на экране персональных данных
  static Finder nameField = GeneralTestScreen.textField('Name');

  /// поле SecondName на экране персональных данных
  static Finder secondNameField = GeneralTestScreen.textField('SecondName');

  /// поле Birthday на экране персональных данных
  static Finder birthdayField = GeneralTestScreen.textField('Birthday');

  /// Кнопка Далее
  static Finder nextButton = find.byType(NextButton);

  /// Выбор города
  static Finder cityField = GeneralTestScreen.textField('Place of residence');

  /// Выбор чекбокса
  static Finder checkbox(String text) => find.text(text); 
  
  /// Заметка о себе
  static Finder noteField =  GeneralTestScreen.textField('Write a few words about yourself');

  /// Кнопка сохранить
  static Finder saveButton = find.widgetWithText(ElevatedButton, 'Save');
}