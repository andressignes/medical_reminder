import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_reminder/l10n/l10n.dart';

final _dateFormat = DateFormat('dd/MM/yyyy');

class EndDateWidget extends StatelessWidget {
  const EndDateWidget({
    Key? key,
    required this.endDate,
  }) : super(key: key);

  final DateTime endDate;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ListTile(
      title: Text(l10n.endDateFieldLabel),
      subtitle: Text(
        _dateFormat.format(endDate),
      ),
    );
  }
}
