import 'dart:developer';

import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:medical_reminder/l10n/l10n.dart';
import 'package:medical_reminder/medication_detail/medication_detail.dart';

class MedicationDetailButton extends StatelessWidget {
  const MedicationDetailButton({
    Key? key,
    required this.medication,
  }) : super(key: key);

  final Medicamento? medication;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ElevatedButton(
      onPressed: medication != null
          ? () => Navigator.of(context).push<void>(
                MedicationDetailPage.route(medication: medication!),
              )
          : null,
      child: Text(l10n.medicationDetailPageTitle),
    );
  }
}
