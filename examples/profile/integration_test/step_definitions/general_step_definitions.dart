import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final generalStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу далее$'),
        (context, tester) async {
      await tester.implicitTap(generalTestScreen.nextBtn);
    },
  ),
];
