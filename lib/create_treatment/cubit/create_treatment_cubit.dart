import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:medical_reminder/core/form_inputs/form_inputs.dart';
import 'package:medical_reminder/core/form_inputs/treatment/treatment.dart';
import 'package:medical_reminder/create_treatment/widgets/frequency_field.dart';

part 'create_treatment_state.dart';

class CreateTreatmentCubit extends Cubit<CreateTreatmentState> {
  CreateTreatmentCubit({
    Medicamento? medicamento,
  }) : super(
          CreateTreatmentState(
            medication: medicamento != null
                ? MedicationFormInput.dirty(value: medicamento)
                : const MedicationFormInput.pure(),
          ),
        );

  void startDateChanged(StartDate date) {
    emit(
      state.copyWith(
        startDate: date,
      ),
    );
  }

  void endDateChanged(EndDate date) {
    emit(
      state.copyWith(
        endDate: date,
      ),
    );
  }

  void frequencyChanged(Frequency value) {
    emit(
      state.copyWith(
        frequency: value,
      ),
    );
  }

  void save() {
    log('save');
  }
}
