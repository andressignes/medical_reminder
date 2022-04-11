import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:medicalreminder/profile/cubit/profile_cubit.dart';

class BirthDateInput extends StatelessWidget {
  const BirthDateInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.birthDate.value.toString(),
          onTap: () => _showDatePicker(context, context.read<ProfileCubit>()),
        );
      },
    );
  }

  Future<void> _showDatePicker(BuildContext context, ProfileCubit cubit) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      final birthDate = BirthDate.dirty(selectedDate);
      cubit.birthDateChanged(birthDate);
    }
  }
}
