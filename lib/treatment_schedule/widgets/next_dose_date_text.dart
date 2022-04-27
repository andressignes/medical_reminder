import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:treatment_repository/treatment_repository.dart';

final _dateFormat = DateFormat('dd/MM/yyyy');

class NextDoseDateText extends StatelessWidget {
  const NextDoseDateText({
    Key? key,
    required this.dose,
  }) : super(key: key);

  final Dose? dose;

  @override
  Widget build(BuildContext context) {
    if (dose == null) {
      return const SizedBox.shrink();
    }
    return Text(
      _dateFormat.format(dose!.scheduledDateTime),
      style: Theme.of(context).textTheme.caption,
    );
  }
}
