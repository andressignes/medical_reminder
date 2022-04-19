import 'package:formz/formz.dart';

/// Validation errors for the [StartDate] [FormzInput].
enum StartDateValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template StartDate}
/// Form input for an Start Date [DateTime] of Treatment.
/// {@endtemplate}
class StartDate extends FormzInput<DateTime?, StartDateValidationError> {
  /// {@macro StartDate}
  const StartDate.pure() : super.pure(null);

  /// {@macro StartDate}
  const StartDate.dirty([DateTime? value]) : super.dirty(value);

  @override
  StartDateValidationError? validator(DateTime? value) {
    return value == null ? StartDateValidationError.invalid : null;
  }
}
