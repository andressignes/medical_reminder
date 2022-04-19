import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:medical_reminder/create_treatment/view/create_treatment_view.dart';
import 'package:medical_reminder/l10n/l10n.dart';

class CreateTreatmentPage extends StatelessWidget {
  const CreateTreatmentPage({
    Key? key,
    this.medicamento,
  }) : super(key: key);

  static Page page() => const MaterialPage<void>(child: CreateTreatmentPage());

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const CreateTreatmentPage());

  final Medicamento? medicamento;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.medicationDetailPageCreateTreatmentButton),
      ),
      body: const CreateTreatmentView(),
    );
  }
}
