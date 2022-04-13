import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:medicalreminder/l10n/l10n.dart';

class MedicationDetailDosageWidget extends StatelessWidget {
  const MedicationDetailDosageWidget({
    Key? key,
    required this.medicamento,
  }) : super(key: key);

  final Medicamento medicamento;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (medicamento.dosis != null) {
      return ListTile(
        title: Text(l10n.dosageFieldLabel),
        subtitle: Text(medicamento.dosis!),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
