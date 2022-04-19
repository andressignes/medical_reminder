import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medical_reminder/core/form_inputs/form_inputs.dart';
import 'package:medical_reminder/create_treatment/cubit/create_treatment_cubit.dart';
import 'package:medical_reminder/l10n/l10n.dart';

const _format = 'dd/MM/yyyy';

class EndDateField extends StatelessWidget {
  EndDateField({Key? key}) : super(key: key);

  final _controller = TextEditingController();
  final dateFormat = DateFormat(_format);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<CreateTreatmentCubit, CreateTreatmentState>(
      builder: (context, state) {
        return TextFormField(
          controller: _controller,
          onTap: () => _onTap(
            context,
            context.read<CreateTreatmentCubit>(),
            _controller,
          ),
          decoration: InputDecoration(
            labelText: l10n.endDateFieldLabel,
            hintText: 'dd/mm/yyyy',
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.datetime,
        );
      },
    );
  }

  Future<void> _onTap(
    BuildContext context,
    CreateTreatmentCubit cubit,
    TextEditingController textEditingController,
  ) async {
    log('_onTap');
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 15)),
    );
    if (selectedDate != null) {
      final endDate = EndDate.dirty(selectedDate);
      cubit.endDateChanged(endDate);
      textEditingController.text =
          endDate.value != null ? dateFormat.format(endDate.value!) : '';
    }
  }
}
