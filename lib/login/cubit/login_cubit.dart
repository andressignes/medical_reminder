import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const LoginState());

  final AuthenticationRepository _authenticationRepository;

  void emailChanged(String email) {
    final emailInput = Email.dirty(email);
    emit(
      state.copyWith(
        email: emailInput,
        status: Formz.validate([emailInput, state.password]),
      ),
    );
  }

  void passwordChanged(String password) {
    final passwordInput = Password.dirty(password);
    emit(
      state.copyWith(
        password: passwordInput,
        status: Formz.validate([state.email, passwordInput]),
      ),
    );
  }

  Future<void> logInWithEmailAndPassword() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
