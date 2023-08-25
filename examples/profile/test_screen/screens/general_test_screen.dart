import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class GeneralTestScreen {
  /// текстовое поле [TextField] по подсказке или хинту [hint]. Строгое соответствие
  static Finder textField(String hint) => find.byWidgetPredicate((widget) {
        return widget is TextField &&
            ((widget.decoration?.labelText == hint) ||
                (widget.decoration?.hintText == hint));
      });
}
