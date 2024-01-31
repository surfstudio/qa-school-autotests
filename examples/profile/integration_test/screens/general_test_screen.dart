import 'package:flutter_test/flutter_test.dart';
import 'package:profile/features/profile/screens/personal_data_screen/widgets/text_form_field_widget.dart';

class GeneralTestScreen {
  ///  Поля ввода на экране персональных данных.
   Finder textFormFieldWidget(String hint) => find.byWidgetPredicate((widget) {
         return widget is TextFormFieldWidget && widget.hintText == hint;
   });
}