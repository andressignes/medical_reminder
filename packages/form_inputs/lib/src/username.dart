import 'package:formz/formz.dart';

/// Validation errors for the [Username] [FormzInput].
enum UsernameValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template username}
/// Form input for an username input.
/// {@endtemplate}
class UsernameFormInput extends FormzInput<String, UsernameValidationError> {
  /// {@macro username}
  const UsernameFormInput.pure() : super.pure('');

  /// {@macro username}
  const UsernameFormInput.dirty([String value = '']) : super.dirty(value);

  @override
  UsernameValidationError? validator(String value) {
    return value.isNotEmpty ? null : UsernameValidationError.invalid;
  }
}
