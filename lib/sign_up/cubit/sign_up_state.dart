part of 'sign_up_cubit.dart';

enum ConfirmPasswordValidationError { invalid }

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const EmailFormInput.pure(),
    this.password = const PasswordFormInput.pure(),
    this.confirmedPassword = const ConfirmedPasswordFormInput.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final EmailFormInput email;
  final PasswordFormInput password;
  final ConfirmedPasswordFormInput confirmedPassword;
  final FormzStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [email, password, confirmedPassword, status];

  SignUpState copyWith({
    EmailFormInput? email,
    PasswordFormInput? password,
    ConfirmedPasswordFormInput? confirmedPassword,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
