import 'package:flutter/material.dart';
import 'package:medical_reminder/forgot_password/view/forgot_password_page.dart';
import 'package:medical_reminder/l10n/l10n.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextButton(
      key: const Key('loginForm_forgotPassword_button'),
      onPressed: () =>
          Navigator.of(context).push<void>(ForgotPasswordPage.route()),
      child: Text(l10n.forgotPasswordButton),
    );
  }
}
