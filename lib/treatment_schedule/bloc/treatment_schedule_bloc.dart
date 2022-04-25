import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:treatment_repository/treatment_repository.dart';

part 'treatment_schedule_event.dart';

part 'treatment_schedule_state.dart';

class TreatmentScheduleBloc
    extends Bloc<TreatmentScheduleEvent, TreatmentScheduleState> {
  TreatmentScheduleBloc({
    required this.userId,
    required TreatmentRepository treatmentRepository,
  })  : _treatmentRepository = treatmentRepository,
        super(const TreatmentScheduleState()) {
    on<TreatmentScheduleSubscriptionRequested>(_onSubscriptionRequested);
    on<DoseTaken>(_onDoseTaken);
  }

  final String userId;
  final TreatmentRepository _treatmentRepository;

  FutureOr<void> _onSubscriptionRequested(
    TreatmentScheduleSubscriptionRequested event,
    Emitter<TreatmentScheduleState> emit,
  ) async {
    emit(state.copyWith(status: TreatmentScheduleStatus.loading));

    final treatments = await _treatmentRepository.getTreatments2(userId);
    emit(
      state.copyWith(
        status: TreatmentScheduleStatus.loaded,
        treatments: treatments,
      ),
    );
  }

  FutureOr<void> _onDoseTaken(
    DoseTaken event,
    Emitter<TreatmentScheduleState> emit,
  ) {
    log('Dose taken: ${event.doseId}');
    emit(
      state.copyWith(
        treatments: state.treatments.map(
          (treatment) {
            if (treatment.id == event.treatmentId) {
              final t = treatment.copyWith(
                doses: treatment.doses.map((dose) {
                  if (dose.id == event.doseId) {
                    return dose.copyWith(
                      intakeDateTime: DateTime.now(),
                    );
                  }
                  return dose;
                }).toList(),
              );
              _treatmentRepository.updateTreatment(t);
              return t;
            }
            return treatment;
          },
        ).toList(),
      ),
    );
  }
}
