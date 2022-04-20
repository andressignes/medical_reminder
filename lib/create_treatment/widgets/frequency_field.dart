import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/create_treatment/form_inputs/form_inputs.dart';
import 'package:medical_reminder/create_treatment/create_treatment.dart';
import 'package:medical_reminder/l10n/l10n.dart';

class FrequencyField extends StatelessWidget {
  const FrequencyField({Key? key}) : super(key: key);

  List<int> get _frequencyOptions => List<int>.of([4, 6, 8, 12]);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<CreateTreatmentBloc, CreateTreatmentState>(
      builder: (context, state) {
        return DropdownButtonFormField<int>(
          items: _frequencyOptions
              .map(
                (frequency) => DropdownMenuItem(
                  value: frequency,
                  child: Text(l10n.everyXHoursFieldLabel(frequency)),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value == null) return;
            context.read<CreateTreatmentBloc>().add(
                  FrequencyChangedCreateTreatmentEvent(
                    Frequency.dirty(value: value),
                  ),
                );
          },
          value: state.frequency.value,
          decoration: InputDecoration(
            labelText: l10n.frequencyFieldLabel,
            border: InputBorder.none,
          ),
        );
      },
    );
  }
}
