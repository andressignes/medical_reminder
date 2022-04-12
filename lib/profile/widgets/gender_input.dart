import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalreminder/app/app.dart';
import 'package:medicalreminder/profile/cubit/profile_cubit.dart';

class GenderInput extends StatelessWidget {
  const GenderInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return DropdownButton<Gender>(
          items: Gender.values.map(
            (e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e.name),
              );
            },
          ).toList(),
          value: context.read<ProfileCubit>().state.gender ??
              context.read<AppBloc>().state.user.gender,
          onChanged: (value) {
            if (value != null) {
              context.read<ProfileCubit>().genderChanged(value);
            }
          },
          hint: const Text('Gender'),
        );
      },
    );
  }
}
