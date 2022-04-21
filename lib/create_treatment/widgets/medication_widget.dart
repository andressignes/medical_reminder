import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/create_treatment/create_treatment.dart';

class MedicationWidget extends StatelessWidget {
  const MedicationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTreatmentBloc, CreateTreatmentState>(
      builder: (context, state) {
        if (state.medication.value == null) {
          return const AddMedicationButton();
        } else {
          return Column(
            children: const [
              MedicationNameField(),
              MedicationImage(),
            ],
          );
        }
      },
    );
  }
}
