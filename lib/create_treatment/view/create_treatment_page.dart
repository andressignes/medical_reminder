import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/app/bloc/app_bloc.dart';
import 'package:medical_reminder/create_treatment/create_treatment.dart';

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
    context.read<CreateTreatmentBloc>().add(
          InitializeCreateTreatmentEvent(
            userId: context.select((AppBloc bloc) => bloc.state.user).id,
            medication: medicamento != null
                ? MedicationFormInput.dirty(value: medicamento!)
                : const MedicationFormInput.pure(),
          ),
        );
    return WillPopScope(
      onWillPop: () {
        context.read<CreateTreatmentBloc>().add(ClearCreateTreatmentEvent());
        return Future.value(true);
      },
      child: const CreateTreatmentView(),
    );
  }
}
