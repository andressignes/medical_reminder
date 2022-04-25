import 'package:flutter/material.dart';
import 'package:medical_reminder/l10n/l10n.dart';
import 'package:medical_reminder/treatment_detail/treatment_detail.dart';
import 'package:medical_reminder/treatment_schedule/model/schedule_item.dart';

class TreatmentDetailPage extends StatelessWidget {
  const TreatmentDetailPage({
    Key? key,
    required this.scheduleItem,
  }) : super(key: key);

  static Route route(ScheduleItem scheduleItem) => MaterialPageRoute<void>(
        builder: (_) => TreatmentDetailPage(scheduleItem: scheduleItem),
      );

  static Page page(ScheduleItem scheduleItem) => MaterialPage<void>(
        child: TreatmentDetailPage(
          scheduleItem: scheduleItem,
        ),
      );

  final ScheduleItem scheduleItem;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.treatmentDetailPageTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
          child: Column(
            children: <Widget>[
              MedicationTextWidget(medicamento: scheduleItem.medication),
              Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        StartDateWidget(
                          startDate: scheduleItem.treatment.startDate,
                        ),
                        EndDateWidget(endDate: scheduleItem.treatment.endDate),
                        DoseWidget(
                          frequency: scheduleItem.treatment.frequencyHours,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        MedicationPhotoWidget(
                          fotos: scheduleItem.medication!.fotos,
                        ),
                        MedicationDetailButton(
                          medication: scheduleItem.medication,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // DosesListView(doses: scheduleItem.doses),
            ],
          ),
        ),
      ),
    );
  }
}
