import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/app/bloc/app_bloc.dart';
import 'package:medical_reminder/treatment_schedule/treatment_schedule.dart';
import 'package:treatment_repository/treatment_repository.dart';

class TreatmentSchedulePage extends StatelessWidget {
  const TreatmentSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    // return ..add(TreatmentScheduleSubscriptionRequested(userId: user.id)),
    context.read<TreatmentScheduleBloc>().add(
          TreatmentScheduleSubscriptionRequested(
            userId: user.id,
          ),
        );
    return const TreatmentScheduleView();
  }
}
