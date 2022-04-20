part of 'treatment_schedule_bloc.dart';

enum TreatmentScheduleStatus {
  initial,
  loading,
  loaded,
  error,
}

class TreatmentScheduleState extends Equatable {
  const TreatmentScheduleState({
    this.status = TreatmentScheduleStatus.initial,
    this.scheduleItems = const <ScheduleItem>[],
  });

  final TreatmentScheduleStatus status;
  final List<ScheduleItem> scheduleItems;

  @override
  List<Object> get props => [
        status,
        scheduleItems,
      ];

  TreatmentScheduleState copyWith({
    TreatmentScheduleStatus? status,
    List<ScheduleItem>? scheduleItems,
  }) {
    return TreatmentScheduleState(
      status: status ?? this.status,
      scheduleItems: scheduleItems ?? this.scheduleItems,
    );
  }
}
