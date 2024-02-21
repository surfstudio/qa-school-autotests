import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final aboutMeStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю информацию о себе и сохраняю данные$'),
        (context, tester) async {
        await tester.implicitEnterText(aboutMeTestScreen.textFormField, 'https://t.me/ad_riaz');
        await tester.implicitTap(aboutMeTestScreen.saveBtn);
        await tester.pumpUntilVisible(mainTestScreen.trait);
    },
  ),
];