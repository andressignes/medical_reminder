import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/create_treatment/view/create_treatment_page.dart';
import 'package:medical_reminder/l10n/l10n.dart';
import 'package:medical_reminder/medication_detail/medication_detail.dart';

class MedicationDetailView extends StatelessWidget {
  const MedicationDetailView({
    Key? key,
    required this.medicamento,
  }) : super(key: key);

  final Medicamento medicamento;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final size = MediaQuery.of(context).size;
    return BlocConsumer<MedicationDetailBloc, MedicationDetailState>(
      listener: _listener,
      builder: (context, state) {
        if (state is MedicationDetailStateLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: Text(l10n.medicationDetailPageTitle),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  MedicationPhotoWidget(
                    fotos: medicamento.fotos,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.01,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MedicationDetailTitleWidget(medicamento: medicamento),
                        MedicationDetailDocumentsButtons(
                          medicamento: medicamento,
                        ),
                        MedicationDetailPharmaceuticalFormWidget(
                          medicamento: medicamento,
                        ),
                        MedicationDetailDosageWidget(medicamento: medicamento),
                        MedicationDetailWarningWidget(medicamento: medicamento),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.medicationDetailPageTitle),
          ),
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  void _listener(
    BuildContext context,
    MedicationDetailState state,
  ) {
    final l10n = context.l10n;
    if (state is MedicationDetailStateLoadedError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.errorSearchMedicationMessage),
        ),
      );
    }
  }
}
