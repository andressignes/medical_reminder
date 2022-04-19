import 'package:flutter/material.dart';
import 'package:medical_reminder/l10n/l10n.dart';

class MedicationNameField extends StatelessWidget {
  const MedicationNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              // hintText: l10n.medicationDetailPageTitle,
              labelText: l10n.medicationDetailPageTitle,
              border: InputBorder.none,
            ),
            controller: TextEditingController(
              text: 'Nombre del medicamento',
            ),
            readOnly: true,
          ),
          Text(
            'Laboratorio',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
