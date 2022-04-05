import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalreminder/l10n/l10n.dart';
import 'package:medicalreminder/sign_up/sign_up.dart';

class ConfirmPasswordInput extends StatelessWidget {
  const ConfirmPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return TextField(
          key: const Key('signUpForm_confirmedPasswordInput_textField'),
          onChanged: (confirmPassword) => context
              .read<SignUpCubit>()
              .confirmedPasswordChanged(confirmPassword),
          obscureText: true,
          decoration: InputDecoration(
            labelText: l10n.confirmPasswordFieldLabel,
            helperText: '',
            errorText: state.confirmedPassword.invalid
                ? l10n.confirmPasswordInvalid
                : null,
          ),
        );
      },
    );
  }
}
