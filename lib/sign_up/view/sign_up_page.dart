import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/l10n/l10n.dart';
import 'package:medical_reminder/sign_up/cubit/sign_up_cubit.dart';
import 'package:medical_reminder/sign_up/view/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.createAccountPageTitle),
      ),
      body: BlocProvider(
        create: (context) => SignUpCubit(
          authenticationRepository: context.read<AuthenticationRepository>(),
        ),
        child: const SignUpForm(),
      ),
    );
  }
}
