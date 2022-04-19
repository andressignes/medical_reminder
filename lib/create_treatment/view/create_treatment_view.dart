import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/create_treatment/cubit/create_treatment_bloc.dart';
import 'package:medical_reminder/create_treatment/widgets/widgets.dart';
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
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              context
                  .read<CreateTreatmentBloc>()
                  .add(SubmitCreateTreatmentEvent());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.02,
          ),
          child: Column(
            children: [
              const MedicationNameField(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        TreatmentPeriodFields(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: const [
                        MedicationImage(),
                        MedicationDetailButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
