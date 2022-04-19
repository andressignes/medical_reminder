import 'package:flutter/material.dart';

class TreatmentPeriodFields extends StatelessWidget {
  const TreatmentPeriodFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Fecha Inicio',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          'Fecha Fin',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          'Frecuencia',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
