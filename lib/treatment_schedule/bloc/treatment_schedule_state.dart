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
    this.treatments = const <Treatment>[],
  });

  final TreatmentScheduleStatus status;
  final List<Treatment> treatments;

  @override
  List<Object> get props => [
        status,
        treatments,
      ];

  TreatmentScheduleState copyWith({
    TreatmentScheduleStatus? status,
    List<Treatment>? treatments,
  }) {
    return TreatmentScheduleState(
      status: status ?? this.status,
      treatments: treatments ?? this.treatments,
    );
  }
}
