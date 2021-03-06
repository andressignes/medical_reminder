part of 'create_treatment_bloc.dart';

class CreateTreatmentState extends Equatable {
  const CreateTreatmentState({
    this.status = FormzStatus.pure,
    this.startDate = const StartDate.pure(),
    this.endDate = const EndDate.pure(),
    this.medication = const MedicationFormInput.pure(),
    this.frequency = const Frequency.pure(),
  });

  final FormzStatus status;
  final MedicationFormInput medication;
  final StartDate startDate;
  final EndDate endDate;
  final Frequency frequency;

  @override
  List<Object?> get props => [
        status,
        medication,
        startDate,
        endDate,
        frequency,
      ];

  CreateTreatmentState copyWith({
    String? userId,
    FormzStatus? status,
    MedicationFormInput? medication,
    StartDate? startDate,
    EndDate? endDate,
    Frequency? frequency,
  }) {
    final r = CreateTreatmentState(
      status: status ?? this.status,
      medication: medication ?? this.medication,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      frequency: frequency ?? this.frequency,
    );
    return r;
  }

  @override
  String toString() => 'CreateTreatmentState { '
      'status: $status, '
      'medication: ${medication.value?.nregistro ?? ''}, '
      'startDate: $startDate, '
      'endDate: $endDate, '
      'frequency: $frequency }';
}
