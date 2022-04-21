import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:equatable/equatable.dart';

part 'medication_detail_event.dart';

part 'medication_detail_state.dart';

class MedicationDetailBloc
    extends Bloc<MedicationDetailEvent, MedicationDetailState> {
  MedicationDetailBloc({
    required this.cimaRepository,
  }) : super(MedicationDetailStateInitial()) {
    on<MedicationFetched>(_onMedicationFetched);
  }

  final CimaRepository cimaRepository;

  FutureOr<void> _onMedicationFetched(
    MedicationFetched event,
    Emitter<MedicationDetailState> emit,
  ) async {
    emit(MedicationDetailStateLoading());
    try {
      final result = await cimaRepository.getMedicamento(
        nregistro: event.medicationId,
      );
      result.fold(
        (l) => log(l.toString()),
        (r) => log(r.toString()),
      );
      emit(
        result.fold(
          (failure) => MedicationDetailStateLoadedError(),
          (medication) => MedicationDetailStateLoaded(medication: medication),
        ),
      );
    } catch (e) {
      emit(MedicationDetailStateLoadedError());
    }
  }
}
