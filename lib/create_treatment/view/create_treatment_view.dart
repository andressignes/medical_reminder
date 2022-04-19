import 'package:flutter/material.dart';
import 'package:medical_reminder/create_treatment/widgets/widgets.dart';

class CreateTreatmentView extends StatelessWidget {
  const CreateTreatmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.02,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  MedicationNameField(),
                  TreatmentPeriodFields(),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: const [
                  MedicationImage(),
                  MedicationDetailButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
