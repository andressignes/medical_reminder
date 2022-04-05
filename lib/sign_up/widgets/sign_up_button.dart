import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:medicalreminder/l10n/l10n.dart';
import 'package:medicalreminder/sign_up/sign_up.dart';

class SingUpButton extends StatelessWidget {
  const SingUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('signUpForm_continue_button'),
                onPressed: state.status.isValidated
                    ? () => context
                        .read<SignUpCubit>()
                        .signUpWithEmailAndPasswordPressed()
                    : null,
                child: Text(l10n.createAccountPageTitle),
              );
      },
    );
  }
}
