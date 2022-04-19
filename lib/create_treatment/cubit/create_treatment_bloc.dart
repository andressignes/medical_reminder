import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:medical_reminder/core/form_inputs/treatment/treatment.dart';
import 'package:treatment_repository/treatment_repository.dart';

part 'create_treatment_state.dart';
part 'create_treatment_event.dart';

class CreateTreatmentBloc
    extends Bloc<CreateTreatmentEvent, CreateTreatmentState> {
  CreateTreatmentBloc({
    required this.treatmentRepository,
  }) : super(const CreateTreatmentState(userId: '')) {
    on<InitializeCreateTreatmentEvent>(_onInitialize);
    on<MedicationChangedCreteTreatmentEvent>(_onMedicationChanged);
    on<StartDateChangedCreateTreatmentEvent>(_onStartDateChanged);
    on<EndDateChangedCreateTreatmentEvent>(_onEndDateChanged);
    on<FrequencyChangedCreateTreatmentEvent>(_onFrequencyChanged);
    on<SubmitCreateTreatmentEvent>(_onSubmit);
  }

  final TreatmentRepository treatmentRepository;

  FutureOr<void> _onInitialize(
    InitializeCreateTreatmentEvent event,
    Emitter<CreateTreatmentState> emit,
  ) {
    emit(
      state.copyWith(
        userId: event.userId,
        medication: event.medication,
      ),
    );
  }

  FutureOr<void> _onStartDateChanged(
    StartDateChangedCreateTreatmentEvent event,
    Emitter<CreateTreatmentState> emit,
  ) {
    emit(
      state.copyWith(
        startDate: event.date,
      ),
    );
  }

  FutureOr<void> _onEndDateChanged(
    EndDateChangedCreateTreatmentEvent event,
    Emitter<CreateTreatmentState> emit,
  ) {
    emit(
      state.copyWith(
        endDate: event.date,
      ),
    );
  }

  FutureOr<void> _onFrequencyChanged(
    FrequencyChangedCreateTreatmentEvent event,
    Emitter<CreateTreatmentState> emit,
  ) {
    final s = state.copyWith(
      frequency: event.frequency,
    );
    emit(s);
  }

  FutureOr<void> _onMedicationChanged(
    MedicationChangedCreteTreatmentEvent event,
    Emitter<CreateTreatmentState> emit,
  ) {
    emit(
      state.copyWith(
        medication: event.medication,
      ),
    );
  }

  FutureOr<void> _onSubmit(
    SubmitCreateTreatmentEvent event,
    Emitter<CreateTreatmentState> emit,
  ) async {
    try {
      log('submit');
      await treatmentRepository.addTreatment(
        Treatment(
          userId: state.userId,
          medicationId: state.medication.value!.nregistro!,
          startDate: state.startDate.value!,
          endDate: state.endDate.value != null ? state.endDate.value! : null,
          frequencyHours: state.frequency.value ?? 0,
        ),
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception catch (e) {
      log('Error: $e');
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
