import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/create_treatment/cubit/create_treatment_cubit.dart';
import 'package:medical_reminder/create_treatment/view/create_treatment_view.dart';
import 'package:medical_reminder/l10n/l10n.dart';

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
      create: (context) => CreateTreatmentCubit(
        medicamento: medicamento,
      ),
      child: const CreateTreatmentView(),
    );
  }
}
