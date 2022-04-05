part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final FormzStatus status;
  final Email email;
  final Password password;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, email, password, errorMessage];

  LoginState copyWith({
    FormzStatus? status,
    Email? email,
    Password? password,
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
