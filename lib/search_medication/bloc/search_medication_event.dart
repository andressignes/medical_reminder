part of 'search_medication_bloc.dart';

abstract class SearchMedicationEvent extends Equatable {
  const SearchMedicationEvent();
}

class MedicationsFetched extends SearchMedicationEvent {
  const MedicationsFetched({
    required this.name,
  });

  final String name;

  @override
  List<Object> get props => [name];
}
