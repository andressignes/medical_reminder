import 'package:formz/formz.dart';

/// Validation errors for the [StartDate] [FormzInput].
enum StartDateValidationError {
  /// Generic invalid error.
  invalid,
  isAfterEndDate
}

/// {@template StartDate}
/// Form input for an Start Date [DateTime] of Treatment.
/// {@endtemplate}
class StartDate extends FormzInput<DateTime?, StartDateValidationError> {
  /// {@macro StartDate}
  const StartDate.pure({this.endDate}) : super.pure(null);

  /// {@macro StartDate}
  const StartDate.dirty({
    this.endDate,
    required DateTime value,
  }) : super.dirty(value);

  final DateTime? endDate;

  @override
  StartDateValidationError? validator(DateTime? value) {
    if (value == null) {
      return StartDateValidationError.invalid;
    }
    if (endDate != null && value.isAfter(endDate!)) {
      return StartDateValidationError.isAfterEndDate;
    }
    return null;
  }
}
