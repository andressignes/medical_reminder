part of 'create_treatment_bloc.dart';

abstract class CreateTreatmentEvent extends Equatable {}

class MedicationChangedCreteTreatmentEvent extends CreateTreatmentEvent {
  MedicationChangedCreteTreatmentEvent(this.medication);

  final MedicationFormInput medication;

  @override
  List<Object> get props => [medication];
}

class InitializeCreateTreatmentEvent extends CreateTreatmentEvent {
  InitializeCreateTreatmentEvent({
    required this.userId,
    required this.medication,
  });

  final String userId;
  final MedicationFormInput medication;

  @override
  List<Object> get props => [
        userId,
        medication,
      ];
}

class StartDateChangedCreateTreatmentEvent extends CreateTreatmentEvent {
  StartDateChangedCreateTreatmentEvent(this.date);

  final StartDate date;

  @override
  List<Object> get props => [date];
}

class EndDateChangedCreateTreatmentEvent extends CreateTreatmentEvent {
  EndDateChangedCreateTreatmentEvent(this.date);

  final EndDate date;

  @override
  List<Object> get props => [date];
}

class FrequencyChangedCreateTreatmentEvent extends CreateTreatmentEvent {
  FrequencyChangedCreateTreatmentEvent(this.frequency);

  final Frequency frequency;

  @override
  List<Object> get props => [frequency];
}

class SubmitCreateTreatmentEvent extends CreateTreatmentEvent {
  @override
  List<Object> get props => [];
}
