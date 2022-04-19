import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/app/app.dart';
import 'package:medical_reminder/l10n/l10n.dart';
import 'package:medical_reminder/profile/cubit/profile_cubit.dart';

class NameInput extends StatelessWidget {
  const NameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextFormField(
          key: const Key('profileForm_nameInput_textField'),
          initialValue: context.read<AppBloc>().state.user.name,
          onChanged: (name) => context.read<ProfileCubit>().nameChanged(name),
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: l10n.usernameFieldLabel,
            helperText: '',
            errorText: state.name.invalid ? l10n.usernameInvalid : null,
          ),
        );
      },
    );
  }
}
