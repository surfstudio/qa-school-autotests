import 'package:flutter_test/flutter_test.dart';
import 'package:profile/assets/strings/test_keys.dart';
import 'package:profile/features/profile/screens/personal_data_screen/personal_data_screen.dart';
import 'package:profile/features/profile/screens/personal_data_screen/widgets/text_form_field_widget.dart';
import 'package:profile/features/profile/widgets/next_button.dart';

class PersonalDataTestScreen {
  /// Экран.
  final Finder trait = find.byType(PersonalDataScreen);

  /// Поле ввода фамилии
  final Finder surnameField =
      find.byWidgetPredicate((widget) {return widget is TextFormFieldWidget && widget.hintText == "Surname";});

  /// Поле ввода имени
  final Finder nameField =
      find.byWidgetPredicate((widget) => widget is TextFormFieldWidget && widget.hintText == "Name");

  /// Поле ввода отчества
  final Finder secondName =
    find.byWidgetPredicate((widget) => widget is TextFormFieldWidget && widget.hintText == "SecondName");

  /// Поле выбора даты рождения
  final Finder dateOfBirthField = find.byKey(TestKeys.dateOfBirthField);
}
