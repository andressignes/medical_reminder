// ignore_for_file: prefer_const_constructors

@Tags(['sequential'])
import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  const passwordSample = 'Aa000000';

  group('PasswordFormInput', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        final password = PasswordFormInput.pure();
        expect(password.value, '');
        expect(password.pure, true);
      });

      test('dirty creates correct instance', () {
        final password = PasswordFormInput.dirty(passwordSample);
        expect(password.value, passwordSample);
        expect(password.pure, false);
      });
    });

    group('validator', () {
      test('returns invalid error when password not have numbers',
          () {
        expect(
          PasswordFormInput.dirty('aaaaaaaa').error,
          PasswordValidationError.invalid,
        );
      });

      test(
        'returns invalid when password not have upper case',
        () {
          expect(
            PasswordFormInput.dirty('a0000000').error,
            PasswordValidationError.invalid,
          );
        },
      );

      test(
        'returns invalid when password not have lower case',
            () {
          expect(
            PasswordFormInput.dirty('A0000000').error,
            PasswordValidationError.invalid,
          );
        },
      );

      test(
        'returns invalid when password too short',
            () {
          expect(
            PasswordFormInput.dirty('a0').error,
            PasswordValidationError.invalid,
          );
        },
      );

      test('is valid when password is valid', () {
        expect(
          PasswordFormInput.dirty(passwordSample).error,
          isNull,
        );
      });
    });
  });
}
