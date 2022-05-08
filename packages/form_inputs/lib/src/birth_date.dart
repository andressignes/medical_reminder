import 'package:formz/formz.dart';

/// Validation errors for the [BirthDate] [FormzInput].
enum BirthDateValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template BirthDate}
/// Form input for an Birth Date input.
/// {@endtemplate}
class BirthDateFormInput extends FormzInput<DateTime?, BirthDateValidationError> {
  /// {@macro BirthDate}
  const BirthDateFormInput.pure() : super.pure(null);

  /// {@macro BirthDate}
  const BirthDateFormInput.dirty([DateTime? value]) : super.dirty(value);

  @override
  BirthDateValidationError? validator(DateTime? value) {
    return value == null ? BirthDateValidationError.invalid : null;
  }
}
