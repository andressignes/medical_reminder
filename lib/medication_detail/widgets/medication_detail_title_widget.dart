import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';

class MedicationDetailTitleWidget extends StatelessWidget {
  const MedicationDetailTitleWidget({
    Key? key,
    required this.medicamento,
  }) : super(key: key);

  final Medicamento medicamento;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          medicamento.nombre ?? '',
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          medicamento.labtitular ?? '',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
        ),
      ],
    );
  }
}
