import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:medicalreminder/app/app.dart';
import 'package:medicalreminder/profile/cubit/profile_cubit.dart';

class BirthDateInput extends StatelessWidget {
  BirthDateInput({Key? key}) : super(key: key);

  late TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    log(context.read<AppBloc>().state.user.birthDate.toString());
    textController = TextEditingController(
      text: context.read<AppBloc>().state.user.birthDate.toString(),
    );
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return TextFormField(
          onTap: () => _showDatePicker(
            context,
            context.read<ProfileCubit>(),
            textController,
          ),
          controller: textController,
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
      final birthDate = BirthDate.dirty(selectedDate);
      cubit.birthDateChanged(birthDate);
      textEditingController.text = birthDate.value.toString();
    }
  }
}
