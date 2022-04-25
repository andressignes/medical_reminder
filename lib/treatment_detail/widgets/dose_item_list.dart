import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medical_reminder/treatment_schedule/bloc/treatment_schedule_bloc.dart';
import 'package:treatment_repository/treatment_repository.dart';

final _dateFormat = DateFormat('dd/MM/yyyy');
final _timeFormat = DateFormat('HH:mm');

class DoseItemList extends StatelessWidget {
  const DoseItemList({
    Key? key,
    required this.dose,
    required this.treatmentId,
  }) : super(key: key);

  final Dose dose;
  final String treatmentId;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<TreatmentScheduleBloc, TreatmentScheduleState>(
      builder: (context, state) {
        final currentDose = state.treatments
            .firstWhere(
              (treatment) => treatment.id == treatmentId,
            )
            .doses
            .firstWhere((element) => element.id == dose.id);
        return InkWell(
          onTap: () =>
              currentDose.intakeDateTime == null ? _onTap(context) : null,
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.01,
                vertical: size.height * 0.01,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ScheduledDateText(dose: dose),
                  const Spacer(),
                  _IntakeDateText(dose: dose),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onTap(BuildContext context) {
    context.read<TreatmentScheduleBloc>().add(
          DoseTaken(
            treatmentId: treatmentId,
            doseId: dose.id!,
          ),
        );
  }
}

class _ScheduledDateText extends StatelessWidget {
  const _ScheduledDateText({
    Key? key,
    required this.dose,
  }) : super(key: key);

  final Dose dose;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fecha programada',
          style: Theme.of(context).textTheme.caption,
        ),
        Text(
          _dateFormat.format(dose.scheduledDateTime),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          _timeFormat.format(dose.scheduledDateTime),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}

class _IntakeDateText extends StatelessWidget {
  const _IntakeDateText({
    Key? key,
    required this.dose,
  }) : super(key: key);

  final Dose dose;

  @override
  Widget build(BuildContext context) {
    if (dose.intakeDateTime == null) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fecha de toma',
          style: Theme.of(context).textTheme.caption,
        ),
        Text(
          _dateFormat.format(dose.intakeDateTime!),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          _timeFormat.format(dose.intakeDateTime!),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
