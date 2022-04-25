import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/treatment_schedule/treatment_schedule.dart';

class TreatmentScheduleView extends StatelessWidget {
  const TreatmentScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TreatmentScheduleBloc, TreatmentScheduleState>(
      builder: (BuildContext context, state) {
        if (state.scheduleItems.isEmpty) {
          return const Center(
            child: Text('No treatment scheduled'),
          );
        }
        log('List size: ${state.scheduleItems.length}');
        return ListView.builder(
          itemCount: state.scheduleItems.length,
          itemBuilder: (BuildContext context, int index) {
            final scheduleItem = state.scheduleItems[index];
            return TreatmentScheduleItemList(scheduleItem: scheduleItem);
          },
        );
      },
    );
  }
}
