part of 'treatment_schedule_bloc.dart';

abstract class TreatmentScheduleEvent extends Equatable {
  const TreatmentScheduleEvent();
}

class TreatmentScheduleSubscriptionRequested extends TreatmentScheduleEvent {
  const TreatmentScheduleSubscriptionRequested({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}
