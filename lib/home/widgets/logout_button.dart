import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicalreminder/app/bloc/app_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: const Key('homePage_logout_iconButton'),
      icon: const Icon(Icons.exit_to_app),
      onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
    );
  }
}
