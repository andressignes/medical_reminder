part of 'medication_search_bloc.dart';

enum MedicationSearchStatus {
  initial,
  loading,
  loaded,
  error,
}

class MedicationSearchState extends Equatable {
  const MedicationSearchState({
    this.status = MedicationSearchStatus.initial,
    this.medications = const <Medicamento>[],
    this.hasReachedMax = false,
  });

  final MedicationSearchStatus status;
  final List<Medicamento> medications;
  final bool hasReachedMax;

  @override
  List<Object?> get props => [
        status,
        medications,
        hasReachedMax,
      ];

  MedicationSearchState copyWith({
    MedicationSearchStatus? status,
    List<Medicamento>? medications,
    bool? hasReachedMax,
  }) {
    return MedicationSearchState(
      status: status ?? this.status,
      medications: medications ?? this.medications,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return 'SearchMedicationState { '
        'status: $status, '
        'medications length: ${medications.length}, '
        'hasReachedMax: $hasReachedMax }';
  }
}
