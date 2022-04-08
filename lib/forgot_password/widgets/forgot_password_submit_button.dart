import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:medicalreminder/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:medicalreminder/l10n/l10n.dart';

class ForgotPasswordSubmitButton extends StatelessWidget {
  const ForgotPasswordSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: state.status.isValidated
                    ? () => context.read<ForgotPasswordCubit>().forgotPassword()
                    : null,
                child: Text(l10n.loginPageTitle),
              );
      },
    );
  }
}
