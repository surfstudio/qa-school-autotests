import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';


final mainStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу к редактированию профиля$'),
        (context, tester) async {
      await tester.pumpUntilVisible(mainTestScreen.trait);
      await tester.implicitTap(mainTestScreen.editProfileBtn);
      await tester.pumpUntilVisible(personalDataTestScreen.trait);
    },
  ),
];