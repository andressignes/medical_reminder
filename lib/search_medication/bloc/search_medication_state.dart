part of 'search_medication_bloc.dart';

enum SearchMedicationStatus {
  initial,
  loading,
  loaded,
  error,
}

class SearchMedicationState extends Equatable {
  const SearchMedicationState({
    this.status = SearchMedicationStatus.initial,
    this.medications = const <Medicamento>[],
    this.hasReachedMax = false,
  });

  final SearchMedicationStatus status;
  final List<Medicamento> medications;
  final bool hasReachedMax;

  @override
  List<Object?> get props => [
        status,
        medications,
        hasReachedMax,
      ];

  SearchMedicationState copyWith({
    SearchMedicationStatus? status,
    List<Medicamento>? medications,
    bool? hasReachedMax,
  }) {
    return SearchMedicationState(
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
