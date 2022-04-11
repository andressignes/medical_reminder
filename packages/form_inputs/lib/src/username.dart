import 'package:formz/formz.dart';

/// Validation errors for the [Email] [FormzInput].
enum UsernameValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class Username extends FormzInput<String, UsernameValidationError> {
  /// {@macro email}
  const Username.pure() : super.pure('');

  /// {@macro email}
  const Username.dirty([String value = '']) : super.dirty(value);

  @override
  UsernameValidationError? validator(String value) {
    return value.isNotEmpty ? null : UsernameValidationError.invalid;
  }
}
