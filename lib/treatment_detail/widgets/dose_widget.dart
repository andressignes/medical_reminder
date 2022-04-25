import 'package:flutter/material.dart';
import 'package:medical_reminder/l10n/l10n.dart';

class DoseWidget extends StatelessWidget {
  const DoseWidget({
    Key? key,
    required this.frequency,
  }) : super(key: key);

  final int frequency;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ListTile(
      title: Text(l10n.frequencyFieldLabel),
      subtitle: Text(
        l10n.everyXHoursFieldLabel(frequency),
      ),
    );
  }
}
