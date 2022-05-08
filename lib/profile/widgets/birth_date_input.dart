import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:intl/intl.dart';
import 'package:medical_reminder/app/app.dart';
import 'package:medical_reminder/l10n/l10n.dart';
import 'package:medical_reminder/profile/cubit/profile_cubit.dart';

class BirthDateInput extends StatelessWidget {
  BirthDateInput({Key? key}) : super(key: key);

  final TextEditingController textController = TextEditingController();
  final dateFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    textController.text = context.read<AppBloc>().state.user.birthDate != null
        ? dateFormat.format(context.read<AppBloc>().state.user.birthDate!)
        : '';
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return TextFormField(
          onTap: () => _showDatePicker(
            context,
            context.read<ProfileCubit>(),
            textController,
          ),
          controller: textController,
          decoration: InputDecoration(
            labelText: l10n.birthDateFieldLabel,
          ),
        );
      },
    );
  }

  Future<void> _showDatePicker(
    BuildContext context,
    ProfileCubit cubit,
    TextEditingController textEditingController,
  ) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      log('changed');
      final birthDate = BirthDateFormInput.dirty(selectedDate);
      cubit.birthDateChanged(birthDate);
      textEditingController.text =
          birthDate.value != null ? dateFormat.format(birthDate.value!) : '';
    }
  }
}
