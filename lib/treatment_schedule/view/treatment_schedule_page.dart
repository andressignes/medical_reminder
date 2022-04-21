import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/treatment_schedule/treatment_schedule.dart';

class TreatmentSchedulePage extends StatelessWidget {
  const TreatmentSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<TreatmentScheduleBloc>().add(
          const TreatmentScheduleSubscriptionRequested(),
        );
    return const TreatmentScheduleView();
  }
}
