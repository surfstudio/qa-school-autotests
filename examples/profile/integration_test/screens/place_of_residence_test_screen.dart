import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/assets/strings/place_residence_screen_strings.dart';
import 'package:profile/assets/strings/test_keys.dart';
import 'package:profile/features/profile/screens/place_residence/place_residence_screen.dart';


class PlaceOfResidenceTestScreen {
  /// Экран выбора города
  final Finder residenceScreen = find.byType(PlaceResidenceScreen);

  /// Поле ввода адреса через плейсхолдер
  // final Finder residenceField = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == PlaceResidenceScreenStrings.placeResidenceTitle);

  /// Поле ввода адреса через ключ
  final Finder residenceField = find.byKey(TestKeys.placeOfResidenceField);

  /// Выпадашка с подсказкой адреса
  final Finder listOfCities = find.byType(ListTile);
}
