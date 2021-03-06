import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:medical_reminder/create_treatment/create_treatment.dart';
import 'package:medical_reminder/treatment_schedule/bloc/treatment_schedule_bloc.dart';

class SaveTreatmentButton extends StatelessWidget {
  const SaveTreatmentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTreatmentBloc, CreateTreatmentState>(
      builder: (context, state) {
        return IconButton(
          icon: const Icon(Icons.save),
          onPressed: state.status.isValid ? () => _savePressed(context) : null,
        );
      },
    );
  }

  void _savePressed(BuildContext context) {
    context.read<CreateTreatmentBloc>()
      ..add(SubmitCreateTreatmentEvent())
      ..add(ClearCreateTreatmentEvent());
    context
        .read<TreatmentScheduleBloc>()
        .add(const TreatmentScheduleSubscriptionRequested());
    Navigator.of(context).pop();
  }
}
