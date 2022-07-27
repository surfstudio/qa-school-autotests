import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class MainTestScreen {
  /// кнопка редактирования профиля на главном экране
  static Finder editProfileBtn =
      find.widgetWithText(ElevatedButton, 'Edit profile');
}
