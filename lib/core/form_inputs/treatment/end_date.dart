import 'package:formz/formz.dart';

/// Validation errors for the [EndDate] [FormzInput].
enum EndDateValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template EndDate}
/// Form input for an End Date of treatment.
/// {@endtemplate}
class EndDate extends FormzInput<DateTime?, EndDateValidationError> {
  /// {@macro EndDate}
  const EndDate.pure() : super.pure(null);

  /// {@macro end_date}
  const EndDate.dirty([DateTime? value]) : super.dirty(value);

  @override
  EndDateValidationError? validator(DateTime? value) {
    return value == null ? EndDateValidationError.invalid : null;
  }
}
