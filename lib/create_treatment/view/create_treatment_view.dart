import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:medical_reminder/create_treatment/create_treatment.dart';
import 'package:medical_reminder/create_treatment/widgets/medication_widget.dart';
import 'package:medical_reminder/l10n/l10n.dart';

class CreateTreatmentView extends StatelessWidget {
  const CreateTreatmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.medicationDetailPageCreateTreatmentButton),
        actions: const [
          SaveTreatmentButton(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MedicationWidget(),
              StartDateField(),
              EndDateField(),
              const FrequencyField(),
            ],
          ),
        ),
      ),
    );
  }
}
