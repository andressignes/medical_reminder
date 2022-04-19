import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:medical_reminder/forgot_password/view/forgot_password_form.dart';
import 'package:medical_reminder/l10n/l10n.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ForgotPasswordPage());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.forgotPasswordTitle),
      ),
      body: BlocProvider<ForgotPasswordCubit>(
        create: (context) => ForgotPasswordCubit(
          authenticationRepository: context.read<AuthenticationRepository>(),
        ),
        child: const ForgotPasswordForm(),
      ),
    );
  }
}
