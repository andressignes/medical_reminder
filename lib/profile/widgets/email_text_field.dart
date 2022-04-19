import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/app/app.dart';
import 'package:medical_reminder/l10n/l10n.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return TextFormField(
          key: const Key('profile_email_textField'),
          initialValue: context.read<AppBloc>().state.user.email,
          enabled: false,
          decoration: InputDecoration(
            labelText: l10n.emailFieldLabel,
          ),
        );
      },
    );
  }
}
