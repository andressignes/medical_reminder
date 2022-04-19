import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/create_treatment/cubit/create_treatment_bloc.dart';

class MedicationNameField extends StatelessWidget {
  const MedicationNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CreateTreatmentBloc, CreateTreatmentState>(
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
