part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.email = const EmailFormInput.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final FormzStatus status;
  final EmailFormInput email;
  final String? errorMessage;

  ForgotPasswordState copyWith({
    EmailFormInput? email,
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
