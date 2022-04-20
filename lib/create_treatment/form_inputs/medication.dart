import 'package:cima_repository/cima_repository.dart';
import 'package:formz/formz.dart';

/// Validation errors for the [MedicationFormInput] [FormzInput].
enum MedicationValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template MedicationFormInput}
/// Form input for an Medication of Treatment.
/// {@endtemplate}
class MedicationFormInput
    extends FormzInput<Medicamento?, MedicationValidationError> {
  /// {@macro MedicationFormInput}
  const MedicationFormInput.pure() : super.pure(null);

  /// {@macro MedicationFormInput}
  const MedicationFormInput.dirty({required Medicamento value})
      : super.dirty(value);

  @override
  MedicationValidationError? validator(Medicamento? value) {
    return value == null ? MedicationValidationError.invalid : null;
  }
}
