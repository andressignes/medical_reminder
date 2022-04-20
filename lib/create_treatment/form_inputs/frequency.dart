import 'package:formz/formz.dart';

/// Validation errors for the [Frequency] [FormzInput].
enum FrequencyValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template Frequency}
/// Form input for an Frequency [int] of Treatment.
/// {@endtemplate}
class Frequency extends FormzInput<int?, FrequencyValidationError> {
  /// {@macro Frequency}
  const Frequency.pure() : super.pure(null);

  /// {@macro Frequency}
  const Frequency.dirty({required int value}) : super.dirty(value);

  @override
  FrequencyValidationError? validator(int? value) {
    return value == null ? FrequencyValidationError.invalid : null;
  }
}
