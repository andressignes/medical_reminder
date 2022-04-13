part of 'medication_search_bloc.dart';

abstract class MedicationSearchEvent extends Equatable {
  const MedicationSearchEvent();
}

class MedicationsFetched extends MedicationSearchEvent {
  const MedicationsFetched({
    required this.name,
  });

  final String name;

  @override
  List<Object> get props => [name];
}
