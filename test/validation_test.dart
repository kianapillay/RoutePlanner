import 'package:flutter_test/flutter_test.dart';
import 'package:route_planner/utils/validation.dart';

void main() {
  test('Rejects empty stop names', () {
    expect(StopValidation.isValidName(''), false);
  });

  test('Rejects invalid latitude values', () {
    expect(StopValidation.isValidLatitude(100), false);
  });

  test('Rejects invalid longitude values', () {
    expect(StopValidation.isValidLongitude(200), false);
  });
}
