import 'package:flutter/material.dart';
import 'package:medical_reminder/treatment_detail/treatment_detail.dart';
import 'package:treatment_repository/treatment_repository.dart';

class TreatmentScheduleItemList extends StatelessWidget {
  const TreatmentScheduleItemList({
    Key? key,
    required this.treatment,
  }) : super(key: key);

  final Treatment treatment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push<void>(
        TreatmentDetailPage.route(
          treatment,
        ),
      ),
      child: Card(
        child: Column(
          children: [
            Text(
              treatment.id,
            ),
            Text(
              treatment.medicamento?.nombre ?? '',
            ),
            Text(
              treatment.startDate.toIso8601String(),
            ),
            Text(
              treatment.endDate.toIso8601String(),
            ),
          ],
        ),
      ),
    );
  }
}
