part of 'treatment_schedule_bloc.dart';

abstract class TreatmentScheduleEvent extends Equatable {
  const TreatmentScheduleEvent();
}

class TreatmentScheduleSubscriptionRequested extends TreatmentScheduleEvent {
  const TreatmentScheduleSubscriptionRequested();

  @override
  List<Object?> get props => [];
}

class DoseTaken extends TreatmentScheduleEvent {
  const DoseTaken({
    required this.treatmentId,
    required this.doseId,
  });

  final String treatmentId;
  final String doseId;

  @override
  List<Object?> get props => [treatmentId, doseId];
}

class TreatmentDeleted extends TreatmentScheduleEvent {
  const TreatmentDeleted({
    required this.treatmentId,
  });

  final String treatmentId;

  @override
  List<Object?> get props => [treatmentId];
}
