import 'package:flutter/material.dart';
import 'package:medical_reminder/create_treatment/widgets/end_date_field.dart';
import 'package:medical_reminder/create_treatment/widgets/frequency_field.dart';
import 'package:medical_reminder/create_treatment/widgets/start_date_field.dart';

class TreatmentPeriodFields extends StatelessWidget {
  const TreatmentPeriodFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StartDateField(),
        EndDateField(),
        const FrequencyField(),
      ],
    );
  }
}
