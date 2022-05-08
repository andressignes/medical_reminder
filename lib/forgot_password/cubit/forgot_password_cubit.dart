import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({
    required this.authenticationRepository,
  }) : super(const ForgotPasswordState());

  final AuthenticationRepository authenticationRepository;

  void emailChanged(String email) {
    final emailInput = EmailFormInput.dirty(email);
    emit(
      state.copyWith(
        email: emailInput,
        status: Formz.validate([emailInput]),
      ),
    );
  }

  Future<void> forgotPassword() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await authenticationRepository.forgotPassword(
        email: state.email.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on ForgotPasswordFailure catch (e) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage: e.message,
        ),
      );
    }
  }
}
