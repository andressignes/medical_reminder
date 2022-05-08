// ignore_for_file: prefer_const_constructors
import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  const nameString = 'Andres';
  group('UsernameFormInput', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        final name = UsernameFormInput.pure();
        expect(name.value, '');
        expect(name.pure, true);
      });

      test('dirty creates correct instance', () {
        final name = UsernameFormInput.dirty(nameString);
        expect(name.value, nameString);
        expect(name.pure, false);
      });
    });

    group('validator', () {
      test('returns invalid error when name is not valid', () {
        expect(
          UsernameFormInput.dirty().error,
          UsernameValidationError.invalid,
        );
      });

      test('is valid when name is valid', () {
        expect(
          UsernameFormInput.dirty(nameString).error,
          isNull,
        );
      });
    });
  });
}