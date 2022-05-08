part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const EmailFormInput.pure(),
    this.password = const PasswordFormInput.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final FormzStatus status;
  final EmailFormInput email;
  final PasswordFormInput password;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, email, password, errorMessage];

  LoginState copyWith({
    FormzStatus? status,
    EmailFormInput? email,
    PasswordFormInput? password,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
