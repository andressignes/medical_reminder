import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/l10n/l10n.dart';
import 'package:medical_reminder/login/cubit/login_cubit.dart';
import 'package:medical_reminder/login/view/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.loginPageTitle),
      ),
      body: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(
          authenticationRepository: context.read<AuthenticationRepository>(),
        ),
        child: const LoginForm(),
      ),
    );
  }
}
