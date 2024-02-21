import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final interestsStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю интересы$'),
    (context, tester) async {

      final List<String> testInterests = <String>[
        'Photo',
        'Art',
        'Home decor',
        'Food and drink',
      ];

      for (var i = 0; i < testInterests.length; i++) {
        await tester.implicitTap(find.text(testInterests[i]));
      }
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу далее на экран информации о себе$'),
        (context, tester) async {
      await tester.pumpUntilVisible(interestsTestScreen.trait);
      await tester.implicitTap(generalTestScreen.nextBtn);
      await tester.pumpUntilVisible(aboutMeTestScreen.trait);
    },
  ),
];
