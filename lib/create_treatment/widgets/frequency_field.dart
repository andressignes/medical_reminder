import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/core/form_inputs/form_inputs.dart';
import 'package:medical_reminder/create_treatment/cubit/create_treatment_cubit.dart';
import 'package:medical_reminder/l10n/l10n.dart';

class FrequencyField extends StatelessWidget {
  const FrequencyField({Key? key}) : super(key: key);

  List<int> get _frequencyOptions => List<int>.of([4, 6, 8, 12]);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<CreateTreatmentCubit, CreateTreatmentState>(
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
          onChanged: (value) => value != null
              ? context.read<CreateTreatmentCubit>().frequencyChanged(
                    Frequency.dirty(value: value),
                  )
              : null,
          value: state.frequency.value,
          decoration: InputDecoration(
            labelText: l10n.frequencyFieldLabel,
            border: InputBorder.none,
          ),
        );
      },
    );
  }

  void _onChanged(int? value) {
    log('FrequencyField: _onChanged: $value');
  }
}
