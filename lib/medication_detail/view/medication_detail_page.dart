import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalreminder/medication_detail/medication_detail.dart';

class MedicationDetailPage extends StatelessWidget {
  const MedicationDetailPage({
    Key? key,
    required this.medication,
  }) : super(key: key);

  static Route route({required Medicamento medication}) =>
      MaterialPageRoute<void>(
        builder: (_) => MedicationDetailPage(
          medication: medication,
        ),
      );

  static Page page({required Medicamento medication}) => MaterialPage<void>(
        child: MedicationDetailPage(
          medication: medication,
        ),
      );

  final Medicamento medication;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicationDetailBloc(
        cimaRepository: context.read<CimaRepository>(),
      )..add(MedicationFetched(medicationId: medication.nregistro!)),
      child: MedicationDetailView(medicamento: medication),
    );
  }
}
