import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:equatable/equatable.dart';

part 'medication_search_event.dart';
part 'medication_search_state.dart';

class MedicationSearchBloc
    extends Bloc<MedicationSearchEvent, MedicationSearchState> {
  MedicationSearchBloc({
    required this.cimaRepository,
  }) : super(const MedicationSearchState()) {
    on<MedicationsFetched>(_onMedicationFetched);
  }

  final CimaRepository cimaRepository;

  FutureOr<void> _onMedicationFetched(
    MedicationsFetched event,
    Emitter<MedicationSearchState> emit,
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
            status: MedicationSearchStatus.error,
          ),
          (medications) => state.copyWith(
            medications: medications,
            //List<Medicamento>.from(state.medications)..addAll(medications),
            status: MedicationSearchStatus.loaded,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MedicationSearchStatus.error,
        ),
      );
    }
  }
}
