import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/features/profile/screens/place_residence/place_residence_screen.dart';

import '../test_screen_library.dart';

class ResidenceTestScreen {
  /// Экран.
  final Finder trait = find.byType(PlaceResidenceScreen);

  Finder suggestionWidget(String city) => find.byWidgetPredicate((widget) {
    return widget is ListTile && widget.title.toString().contains(city);
  });

  // Поле ввода названия города
  Finder get placeField => find.descendant(of: trait, matching: find.byType(TextFormField));
}