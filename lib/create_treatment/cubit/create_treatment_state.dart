part of 'create_treatment_cubit.dart';

class CreateTreatmentState extends Equatable {
  const CreateTreatmentState({
    this.status = FormzStatus.pure,
    this.startDate = const StartDate.pure(),
    this.endDate = const EndDate.pure(),
    this.medication = const MedicationFormInput.pure(),
  });

  final FormzStatus status;
  final MedicationFormInput medication;
  final StartDate startDate;
  final EndDate endDate;

  @override
  List<Object?> get props => [
        status,
        medication,
        startDate,
        endDate,
      ];
}
