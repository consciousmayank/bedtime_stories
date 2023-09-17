import 'package:flutter_test/flutter_test.dart';
import 'package:bedtime_stories/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AppPreferencesServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
