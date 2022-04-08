import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:medicalreminder/sign_up/sign_up.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<SignUpCubit, SignUpState>(
      listener: _signUpListener,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: size.height * 0.1,
          ),
          child: Column(
            children: <Widget>[
              const EmailInput(),
              SizedBox(height: size.height * 0.01),
              const PasswordInput(),
              SizedBox(height: size.height * 0.01),
              const ConfirmPasswordInput(),
              SizedBox(height: size.height * 0.01),
              const SingUpButton(),
            ],
          ),
        ),
      ),
    );
  }

  void _signUpListener(
    BuildContext context,
    SignUpState state,
  ) {
    if (state.status.isSubmissionFailure) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text('state.status.message'),
            backgroundColor: Colors.red,
          ),
        );
    }
  }
}
