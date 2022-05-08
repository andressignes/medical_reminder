// ignore_for_file: prefer_const_constructors

@Tags(['sequential'])
import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  const confirmedPasswordSample = 'Aa000000';
  const passwordSample = 'Aa000000';

  group('ConfirmedPasswordFormInput', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        final confirmedPassword = ConfirmedPasswordFormInput.pure();
        expect(confirmedPassword.value, '');
        expect(confirmedPassword.pure, true);
      });

      test('dirty creates correct instance', () {
        final password = ConfirmedPasswordFormInput.dirty(
          password: passwordSample,
          value: confirmedPasswordSample,
        );
        expect(password.value, passwordSample);
        expect(password.pure, false);
      });
    });

    group('validator', () {
      test('returns invalid error when confirmedPassword not equal to password',
          () {
        expect(
          ConfirmedPasswordFormInput.dirty(
            value: confirmedPasswordSample,
            password: 'Aaaa000000',
          ).error,
          ConfirmedPasswordValidationError.invalid,
        );
      });
    });
  });
}
