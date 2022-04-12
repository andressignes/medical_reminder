part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.email = const Email.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final FormzStatus status;
  final Email email;
  final String? errorMessage;

  ForgotPasswordState copyWith({
    Email? email,
    FormzStatus? status,
    String? errorMessage,
  }) =>
      ForgotPasswordState(
        email: email ?? this.email,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [status, email, errorMessage];
}