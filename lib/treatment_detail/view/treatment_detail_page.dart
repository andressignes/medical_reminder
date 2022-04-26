import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/l10n/l10n.dart';
import 'package:medical_reminder/treatment_detail/treatment_detail.dart';
import 'package:medical_reminder/treatment_schedule/bloc/treatment_schedule_bloc.dart';
import 'package:treatment_repository/treatment_repository.dart';

class TreatmentDetailPage extends StatelessWidget {
  const TreatmentDetailPage({
    Key? key,
    required this.treatment,
  }) : super(key: key);

  static Route route(Treatment treatment) => MaterialPageRoute<void>(
        builder: (_) => TreatmentDetailPage(treatment: treatment),
      );

  static Page page(Treatment treatment) => MaterialPage<void>(
        child: TreatmentDetailPage(
          treatment: treatment,
        ),
      );

  final Treatment treatment;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.treatmentDetailPageTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<TreatmentScheduleBloc>().add(
                    TreatmentDeleted(treatmentId: treatment.id),
                  );
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
          child: Column(
            children: <Widget>[
              MedicationTextWidget(medicamento: treatment.medicamento),
              Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        StartDateWidget(
                          startDate: treatment.startDate,
                        ),
                        EndDateWidget(endDate: treatment.endDate),
                        DoseWidget(
                          frequency: treatment.frequencyHours,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        MedicationPhotoWidget(
                          fotos: treatment.medicamento!.fotos,
                        ),
                        MedicationDetailButton(
                          medication: treatment.medicamento!,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              DosesListView(
                doses: treatment.doses,
                treatmentId: treatment.id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
