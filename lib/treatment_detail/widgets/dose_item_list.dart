import 'package:dose_repository/dose_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final _dateFormat = DateFormat('dd/MM/yyyy HH:mm');

class DoseItemList extends StatelessWidget {
  const DoseItemList({Key? key, required this.dose}) : super(key: key);

  final Dose dose;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(dose.id),
          Text(
            dose.intakeDateTime != null
                ? _dateFormat.format(dose.intakeDateTime!)
                : '',
          ),
          Text(_dateFormat.format(dose.scheduledDateTime)),
        ],
      ),
    );
  }
}
