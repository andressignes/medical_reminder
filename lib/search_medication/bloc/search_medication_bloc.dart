import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:equatable/equatable.dart';

part 'search_medication_event.dart';

part 'search_medication_state.dart';

class SearchMedicationBloc
    extends Bloc<SearchMedicationEvent, SearchMedicationState> {
  SearchMedicationBloc({
    required this.cimaRepository,
  }) : super(const SearchMedicationState()) {
    on<MedicationsFetched>(_onMedicationFetched);
  }

  final CimaRepository cimaRepository;

  FutureOr<void> _onMedicationFetched(
    MedicationsFetched event,
    Emitter<SearchMedicationState> emit,
  ) async {
    if (state.hasReachedMax) return null;
    try {
      final params = {
        'nombre': event.name,
      };
      final medications = await cimaRepository.findMedications(
        params: params,
      );
      emit(
        medications.fold(
          (failure) => state.copyWith(
            status: SearchMedicationStatus.error,
          ),
          (medications) => state.copyWith(
            medications: List<Medicamento>.from(state.medications)
              ..addAll(medications),
            status: SearchMedicationStatus.loaded,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SearchMedicationStatus.error,
        ),
      );
    }
  }
}
