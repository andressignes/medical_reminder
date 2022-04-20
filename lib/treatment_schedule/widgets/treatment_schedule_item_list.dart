import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/medication_detail/bloc/medication_detail_bloc.dart';
import 'package:medical_reminder/treatment_schedule/model/ScheduleItem.dart';
import 'package:treatment_repository/treatment_repository.dart';

class TreatmentScheduleItemList extends StatelessWidget {
  const TreatmentScheduleItemList({
    Key? key,
    required this.scheduleItem,
  }) : super(key: key);

  final ScheduleItem scheduleItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            scheduleItem.medication?.nombre ?? '',
          ),
          Text(
            scheduleItem.treatment.startDate.toIso8601String(),
          ),
          Text(
            scheduleItem.treatment.endDate?.toIso8601String() ?? '',
          ),
        ],
      ),
    );
  }
}
