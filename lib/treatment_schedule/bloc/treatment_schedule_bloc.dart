import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notification_api/notification_api.dart';
import 'package:treatment_repository/treatment_repository.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

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
    on<TreatmentDeleted>(_onTreatmentDeleted);
  }

  final String userId;
  final TreatmentRepository _treatmentRepository;

  FutureOr<void> _onSubscriptionRequested(
    TreatmentScheduleSubscriptionRequested event,
    Emitter<TreatmentScheduleState> emit,
  ) async {
    log('TreatmentScheduleBloc._onSubscriptionRequested');
    emit(state.copyWith(status: TreatmentScheduleStatus.loading));
    await NotificationApi.cancelAllNotifications();

    final treatments = await _treatmentRepository.getTreatments2(userId);
    for (final t in treatments) {
      for (final d in t.doses) {
        if (d.scheduledDateTime.isAfter(DateTime.now())) {
          await NotificationApi.showScheduledNotification(
            // id: int.parse(d.id!),
            title: 'Dose of ${d.scheduledDateTime.toIso8601String()}',
            body: '${t.medicamento?.nombre ?? 'Medicamento'} '
                'de las ${d.scheduledDateTime.toIso8601String()}',
            scheduledDateTime: tz.TZDateTime(
              tz.local,
              d.scheduledDateTime.year,
              d.scheduledDateTime.month,
              d.scheduledDateTime.day,
              d.scheduledDateTime.hour,
              d.scheduledDateTime.minute,
              d.scheduledDateTime.second,
            ),
          );
        }
      }
    }
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

  FutureOr<void> _onTreatmentDeleted(
    TreatmentDeleted event,
    Emitter<TreatmentScheduleState> emit,
  ) async {
    await _treatmentRepository.deleteTreatment(event.treatmentId);
    add(const TreatmentScheduleSubscriptionRequested());
  }
}
