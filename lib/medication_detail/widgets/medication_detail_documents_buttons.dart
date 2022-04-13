import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:medicalreminder/l10n/l10n.dart';
import 'package:medicalreminder/medication_detail/medication_detail.dart';

class MedicationDetailDocumentsButtons extends StatelessWidget {
  const MedicationDetailDocumentsButtons({
    Key? key,
    required this.medicamento,
  }) : super(key: key);

  final Medicamento medicamento;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final l10n = context.l10n;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.01,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PdfButtonWidget(
            title: l10n.technicalSpecificationFieldLabel,
            url: medicamento.getDocumento(TipoDocumento.fichaTecnica)?.url,
          ),
          PdfButtonWidget(
            title: l10n.prospectusFieldLabel,
            url: medicamento.getDocumento(TipoDocumento.prospecto)?.url,
          ),
        ],
      ),
    );
  }
}
