import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalreminder/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:medicalreminder/l10n/l10n.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('forgotPasswordForm_emailInput_textField'),
          onChanged: (email) =>
              context.read<ForgotPasswordCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: l10n.emailFieldLabel,
            helperText: '',
            errorText: state.email.invalid ? l10n.emailInvalid : null,
          ),
        );
      },
    );
  }
}
