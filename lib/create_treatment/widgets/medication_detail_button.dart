import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medical_reminder/l10n/l10n.dart';

class MedicationDetailButton extends StatelessWidget {
  const MedicationDetailButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ElevatedButton(
      onPressed: _onTap,
      child: Text(l10n.medicationDetailPageTitle),
    );
  }

  void _onTap() {
    log('MedicationDetailButton._onTap');
  }
}
