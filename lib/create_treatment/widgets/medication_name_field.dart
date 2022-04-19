import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:medical_reminder/create_treatment/cubit/create_treatment_cubit.dart';
import 'package:medical_reminder/l10n/l10n.dart';

class MedicationNameField extends StatelessWidget {
  const MedicationNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CreateTreatmentCubit, CreateTreatmentState>(
      builder: (context, state) {
        log(state.toString());
        return Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.medication.value?.nombre ?? '',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                state.medication.value?.labtitular ?? '',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
