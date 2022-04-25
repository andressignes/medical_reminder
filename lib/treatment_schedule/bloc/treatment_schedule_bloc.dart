import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dose_repository/dose_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:errors/errors.dart';
import 'package:medical_reminder/treatment_schedule/model/schedule_item.dart';
import 'package:treatment_repository/treatment_repository.dart';

part 'treatment_schedule_event.dart';
part 'treatment_schedule_state.dart';

class TreatmentScheduleBloc
    extends Bloc<TreatmentScheduleEvent, TreatmentScheduleState> {
  TreatmentScheduleBloc({
    required this.userId,
    required TreatmentRepository treatmentRepository,
    required DoseRepository doseRepository,
    required CimaRepository cimaRepository,
  })  : _treatmentRepository = treatmentRepository,
        _doseRepository = doseRepository,
        _cimaRepository = cimaRepository,
        super(const TreatmentScheduleState()) {
    on<TreatmentScheduleSubscriptionRequested>(_onSubscriptionRequested);
  }

  final String userId;
  final TreatmentRepository _treatmentRepository;
  final DoseRepository _doseRepository;
  final CimaRepository _cimaRepository;

  FutureOr<void> _onSubscriptionRequested(
    TreatmentScheduleSubscriptionRequested event,
    Emitter<TreatmentScheduleState> emit,
  ) async {
    emit(state.copyWith(status: TreatmentScheduleStatus.loading));

    final treatments = await _treatmentRepository.getTreatments2(userId);
    emit(
      state.copyWith(scheduleItems: List<ScheduleItem>.empty()),
    );
    for (final treatment in treatments) {
      final response = await Future.wait([
        _cimaRepository.getMedicamento(
          nregistro: treatment.medicationId,
        ),
        _doseRepository.getDoses(treatment.id),
      ]);
      final medication = response[0] as Either<Failure, Medicamento>;
      final doses = response[1] as List<Dose>;
      emit(
        medication.fold(
          (failure) => state.copyWith(
            scheduleItems: [
              ...state.scheduleItems,
              ScheduleItem(
                treatment: treatment,
                doses: doses,
              )
            ],
          ),
          (medication) => state.copyWith(
            scheduleItems: [
              ...state.scheduleItems,
              ScheduleItem(
                treatment: treatment,
                doses: doses,
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
