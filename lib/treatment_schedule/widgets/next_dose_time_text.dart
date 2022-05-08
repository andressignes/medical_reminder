import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_reminder/l10n/l10n.dart';
import 'package:treatment_repository/treatment_repository.dart';

final _timeFormat = DateFormat('HH:mm');

class NextDoseTextTime extends StatelessWidget {
  const NextDoseTextTime({
    Key? key,
    required this.dose,
  }) : super(key: key);

  final Dose? dose;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (dose == null) {
      return Text(
        l10n.noNextDoseFieldLabel,
        style: Theme.of(context).textTheme.headline4!.copyWith(
              fontSize: 24,
            ),
      );
    }
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        _timeFormat.format(
          dose!.scheduledDateTime,
        ),
        style: Theme.of(context).textTheme.headline4!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
      subtitle: Text(l10n.nextDoseFieldLabel),
    );
  }
}
