import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';

class MedicationDetailWarningWidget extends StatelessWidget {
  const MedicationDetailWarningWidget({
    Key? key,
    required this.medicamento,
  }) : super(key: key);

  final Medicamento medicamento;

  @override
  Widget build(BuildContext context) {
    if (medicamento.cpresc != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(
              Icons.warning,
              color: Theme.of(context).errorColor,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                medicamento.cpresc!,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).errorColor,
                    ),
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
