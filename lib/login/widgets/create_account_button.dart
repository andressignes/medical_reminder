import 'package:flutter/material.dart';
import 'package:medicalreminder/l10n/l10n.dart';
import 'package:medicalreminder/sign_up/sign_up.dart' show SignUpPage;

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextButton(
      key: const Key('loginForm_createAccount_button'),
      onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
      child: Text(l10n.createAccountPageTitle),
    );
  }
}
