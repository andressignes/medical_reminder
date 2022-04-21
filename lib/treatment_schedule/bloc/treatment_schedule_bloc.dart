import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_reminder/treatment_schedule/model/schedule_item.dart';
import 'package:treatment_repository/treatment_repository.dart';

part 'treatment_schedule_event.dart';

part 'treatment_schedule_state.dart';

class TreatmentScheduleBloc
    extends Bloc<TreatmentScheduleEvent, TreatmentScheduleState> {
  TreatmentScheduleBloc({
    required TreatmentRepository treatmentRepository,
    required CimaRepository cimaRepository,
  })  : _treatmentRepository = treatmentRepository,
        _cimaRepository = cimaRepository,
        super(const TreatmentScheduleState()) {
    on<TreatmentScheduleSubscriptionRequested>(_onSubscriptionRequested);
  }

  final TreatmentRepository _treatmentRepository;
  final CimaRepository _cimaRepository;

  FutureOr<void> _onSubscriptionRequested(
    TreatmentScheduleSubscriptionRequested event,
    Emitter<TreatmentScheduleState> emit,
  ) async {
    emit(state.copyWith(status: TreatmentScheduleStatus.loading));

    final treatments = await _treatmentRepository.getTreatments2(event.userId);
    log('treatments: $treatments');
    emit(
      state.copyWith(scheduleItems: List<ScheduleItem>.empty()),
    );
    for (final treatment in treatments) {
      final medication = await _cimaRepository.getMedicamento(
        nregistro: treatment.medicationId,
      );
      emit(
        medication.fold(
          (failure) => state.copyWith(
            scheduleItems: [
              ...state.scheduleItems,
              ScheduleItem(
                treatment: treatment,
              )
            ],
          ),
          (medication) => state.copyWith(
            scheduleItems: [
              ...state.scheduleItems,
              ScheduleItem(
                treatment: treatment,
                medication: medication,
              )
            ],
          ),
        ),
      );
    }

    emit(
      state.copyWith(
        status: TreatmentScheduleStatus.loaded,
      ),
    );
  }
}
