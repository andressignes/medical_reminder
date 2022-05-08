import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;

  void emailChanged(String email) {
    final emailInput = EmailFormInput.dirty(email);
    emit(
      state.copyWith(
        email: emailInput,
        status: Formz.validate([
          emailInput,
          state.password,
          state.confirmedPassword,
        ]),
      ),
    );
  }

  void passwordChanged(String password) {
    final passwordInput = PasswordFormInput.dirty(password);
    emit(
      state.copyWith(
        password: passwordInput,
        status: Formz.validate([
          state.email,
          passwordInput,
          state.confirmedPassword,
        ]),
      ),
    );
  }

  void confirmedPasswordChanged(String confirmedPassword) {
    final confirmedPasswordInput = ConfirmedPasswordFormInput.dirty(
      value: confirmedPassword,
      password: state.password.value,
    );
    emit(
      state.copyWith(
        confirmedPassword: confirmedPasswordInput,
        status: Formz.validate([
          state.email,
          state.password,
          confirmedPasswordInput,
        ]),
      ),
    );
  }

  Future<void> signUpWithEmailAndPasswordPressed() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.signUp(
        email: state.email.value,
        password: state.password.value,
      );
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
