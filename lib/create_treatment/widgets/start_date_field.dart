import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:medical_reminder/create_treatment/create_treatment.dart';
import 'package:medical_reminder/l10n/l10n.dart';

const _format = 'dd/MM/yyyy HH:mm';

class StartDateField extends StatelessWidget {
  StartDateField({Key? key}) : super(key: key);

  final _controller = TextEditingController();
  final dateFormat = DateFormat(_format);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<CreateTreatmentBloc, CreateTreatmentState>(
      listener: (context, state) {
        if (state.startDate.status == FormzInputStatus.invalid) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(l10n.invalidStartDate),
                backgroundColor: Colors.redAccent,
              ),
            );
        }
      },
      builder: (context, state) {
        _controller.text = state.startDate.value != null
            ? dateFormat.format(state.startDate.value!)
            : '';
        return TextFormField(
          controller: _controller,
          onTap: () => _onTap(
            context,
            context.read<CreateTreatmentBloc>(),
          ),
          decoration: InputDecoration(
            labelText: l10n.startDateFieldLabel,
            hintText: 'dd/mm/yyyy hh:mm',
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.datetime,
        );
      },
    );
  }

  Future<void> _onTap(
    BuildContext context,
    CreateTreatmentBloc bloc,
  ) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 15)),
    );
    if (selectedDate != null) {
      final selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (selectedTime != null) {
        final dateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );
        log('selected dateTime: $dateTime');
        log('now: ${DateTime.now()}');
        final startDate = StartDate.dirty(
          value: selectedDate.add(
            Duration(
              hours: selectedTime.hour,
              minutes: selectedTime.minute,
            ),
          ),
          endDate: bloc.state.endDate.value,
        );
        bloc.add(StartDateChangedCreateTreatmentEvent(startDate));
        _controller.text =
            startDate.value != null ? dateFormat.format(startDate.value!) : '';
      }
    }
  }
}
