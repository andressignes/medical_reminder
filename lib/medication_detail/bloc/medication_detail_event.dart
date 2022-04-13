part of 'medication_detail_bloc.dart';

abstract class MedicationDetailEvent extends Equatable {
  const MedicationDetailEvent();
}

class MedicationFetched extends MedicationDetailEvent {
  const MedicationFetched({
    required this.medicationId,
  });

  final String medicationId;

  @override
  List<Object> get props => [medicationId];
}
