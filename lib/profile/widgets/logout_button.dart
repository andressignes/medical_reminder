import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalreminder/app/bloc/app_bloc.dart';
import 'package:medicalreminder/l10n/l10n.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: TextButton(
        onPressed: () {
          context.read<AppBloc>().add(AppLogoutRequested());
          Navigator.of(context).pop();
        },
        child: Text(l10n.logoutButton),
      ),
    );
  }
}
