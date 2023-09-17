import 'package:flutter_test/flutter_test.dart';
import 'package:bedtime_stories/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ChangeThemeSheetModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
