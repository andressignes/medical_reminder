import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';

class MedicationTextWidget extends StatelessWidget {
  const MedicationTextWidget({
    Key? key,
    required this.medicamento,
  }) : super(key: key);

  final Medicamento? medicamento;

  @override
  Widget build(BuildContext context) {
    if (medicamento == null) {
      return const SizedBox.shrink();
    }
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
        vertical: size.height * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            medicamento!.nombre ?? '',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            medicamento!.labtitular ?? '',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
          ),
        ],
      ),
    );
  }
}
