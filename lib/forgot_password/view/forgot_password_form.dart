import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:medicalreminder/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:medicalreminder/forgot_password/widgets/widgets.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: _forgotPasswordListener,
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
              const ForgotPasswordSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  void _forgotPasswordListener(
    BuildContext context,
    ForgotPasswordState state,
  ) {
    if (state.status.isSubmissionFailure) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(state.errorMessage ?? 'Unknown Error'),
            backgroundColor: Colors.red,
          ),
        );
    }
  }
}
