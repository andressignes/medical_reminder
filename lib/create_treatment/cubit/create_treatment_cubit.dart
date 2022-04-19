import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:medical_reminder/core/form_inputs/form_inputs.dart';
import 'package:medical_reminder/core/form_inputs/treatment/treatment.dart';

part 'create_treatment_state.dart';

class CreateTreatmentCubit extends Cubit<CreateTreatmentState> {
  CreateTreatmentCubit() : super(const CreateTreatmentState());
}
