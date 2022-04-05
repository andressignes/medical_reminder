import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:medicalreminder/login/cubit/login_cubit.dart';
import 'package:medicalreminder/login/login.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<LoginCubit, LoginState>(
      listener: _loginListener,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const EmailInput(),
            SizedBox(height: size.height * 0.01),
            const PasswordInput(),
            SizedBox(height: size.height * 0.01),
            const LoginButton(),
            SizedBox(height: size.height * 0.01),
            const CreateAccountButton(),
          ],
        ),
      ),
    );
  }

  void _loginListener(BuildContext context, LoginState state) {
    if (state.status.isSubmissionFailure) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text('PUT Error: ${state.errorMessage}'),
            backgroundColor: Colors.red,
          ),
        );
    }
  }
}
