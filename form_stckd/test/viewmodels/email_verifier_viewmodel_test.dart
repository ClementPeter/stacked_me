import 'package:flutter_test/flutter_test.dart';
import 'package:form_stckd/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('EmailVerifierViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
