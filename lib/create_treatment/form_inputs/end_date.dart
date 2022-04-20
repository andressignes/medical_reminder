import 'package:formz/formz.dart';

/// Validation errors for the [EndDate] [FormzInput].
enum EndDateValidationError {
  /// Generic invalid error.
  invalid,
  isBeforeStartDate
}

/// {@template EndDate}
/// Form input for an End Date of treatment.
/// {@endtemplate}
class EndDate extends FormzInput<DateTime?, EndDateValidationError> {
  /// {@macro EndDate}
  const EndDate.pure({this.startDate}) : super.pure(null);

  /// {@macro end_date}
  const EndDate.dirty({
    required DateTime value,
    this.startDate,
  }) : super.dirty(value);

  final DateTime? startDate;

  @override
  EndDateValidationError? validator(DateTime? value) {
    if (value == null) {
      return EndDateValidationError.invalid;
    }
    if (startDate != null && value.isBefore(startDate!)) {
      return EndDateValidationError.isBeforeStartDate;
    }
    return null;
  }
}
