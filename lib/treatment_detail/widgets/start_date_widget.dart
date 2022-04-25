import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_reminder/l10n/l10n.dart';

final _dateFormat = DateFormat('dd/MM/yyyy HH:mm');

class StartDateWidget extends StatelessWidget {
  const StartDateWidget({
    Key? key,
    required this.startDate,
  }) : super(key: key);

  final DateTime startDate;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ListTile(
      title: Text(l10n.startDateFieldLabel),
      subtitle: Text(
        _dateFormat.format(startDate),
      ),
    );
  }
}
