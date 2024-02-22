import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/features/profile/screens/about_me_screen/about_me_screen.dart';

import '../test_screen_library.dart';

class AboutMeTestScreen {
  // Экран.
  final Finder trait = find.byType(AboutMeScreen);

  // Поле ввода
  Finder textFormField = find.byWidgetPredicate((widget) {
    return widget is TextFormField;
  });

  // Кнопка Save.
  final Finder saveBtn = find.byType(ElevatedButton);
}