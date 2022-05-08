// ignore_for_file: prefer_const_constructors
import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  final birthDate = DateTime.now().subtract(Duration(days: 365 * 20));
  group('BirthFormInput', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        final birthDate = BirthDateFormInput.pure();
        expect(birthDate.value, null);
        expect(birthDate.pure, true);
      });

      test('dirty creates correct instance', () {
        final email = BirthDateFormInput.dirty(birthDate);
        expect(email.value, birthDate);
        expect(email.pure, false);
      });
    });

    group('validator', () {
      test('returns invalid error when birth date is empty', () {
        expect(
          BirthDateFormInput.dirty().error,
          BirthDateValidationError.invalid,
        );
      });

      test('is valid when email is valid', () {
        expect(
          BirthDateFormInput.dirty(birthDate).error,
          isNull,
        );
      });
    });
  });
}
