import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:medicalreminder/l10n/l10n.dart';
import 'package:medicalreminder/medication_detail/medication_detail.dart';

class MedicationDetailPharmaceuticalFormWidget extends StatelessWidget {
  const MedicationDetailPharmaceuticalFormWidget({
    Key? key,
    required this.medicamento,
  }) : super(key: key);

  final Medicamento medicamento;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (medicamento.formaFarmaceutica != null) {
      return ListTile(
        title: Text(l10n.pharmaceuticalFormFieldLabel),
        subtitle: Text('${medicamento.formaFarmaceutica!.nombre}'),
        leading: PharmaceuticalFormPhotoWidget(
          fotos: medicamento.fotos,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
