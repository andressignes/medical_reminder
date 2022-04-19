import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/app/bloc/app_bloc.dart';
import 'package:medical_reminder/core/form_inputs/form_inputs.dart';
import 'package:medical_reminder/create_treatment/cubit/create_treatment_bloc.dart';
import 'package:medical_reminder/create_treatment/view/create_treatment_view.dart';
import 'package:treatment_repository/treatment_repository.dart';

class CreateTreatmentPage extends StatelessWidget {
  const CreateTreatmentPage({
    Key? key,
    this.medicamento,
  }) : super(key: key);

  static Page page() => const MaterialPage<void>(child: CreateTreatmentPage());

  static Route route({Medicamento? medicamento}) => MaterialPageRoute<void>(
        builder: (_) => CreateTreatmentPage(
          medicamento: medicamento,
        ),
      );

  final Medicamento? medicamento;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateTreatmentBloc(
        treatmentRepository: context.read<TreatmentRepository>(),
      )..add(
          InitializeCreateTreatmentEvent(
            userId: context.read<AppBloc>().state.user.id,
            medication: MedicationFormInput.dirty(value: medicamento!),
          ),
        ),
      child: const CreateTreatmentView(),
    );
  }
}
