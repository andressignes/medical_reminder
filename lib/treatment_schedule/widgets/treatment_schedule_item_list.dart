import 'package:flutter/material.dart';
import 'package:medical_reminder/treatment_detail/treatment_detail.dart';
import 'package:medical_reminder/treatment_schedule/widgets/medication_image.dart';
import 'package:medical_reminder/treatment_schedule/widgets/next_dose_date_text.dart';
import 'package:medical_reminder/treatment_schedule/widgets/next_dose_time_text.dart';
import 'package:treatment_repository/treatment_repository.dart';

class TreatmentScheduleItemList extends StatelessWidget {
  const TreatmentScheduleItemList({
    Key? key,
    required this.treatment,
  }) : super(key: key);

  final Treatment treatment;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.of(context).push<void>(
        TreatmentDetailPage.route(
          treatment,
        ),
      ),
      child: Card(
        shadowColor: Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03,
            vertical: size.height * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NextDoseDateText(dose: treatment.nextDose),
              Text(
                treatment.medicamento?.nombre ?? '',
                style: Theme.of(context).textTheme.headline6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: NextDoseTextTime(dose: treatment.nextDose),
                  ),
                  Flexible(
                    child: MedicationImage(
                      photos: treatment.medicamento?.fotos,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
