part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.name = const Username.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.errorMessage,
  });

  final FormzStatus status;
  final Email email;
  final Password password;
  final Username name;
  final ConfirmedPassword confirmedPassword;
  final String? errorMessage;

  ProfileState copyWith({
    FormzStatus? status,
    Email? email,
    Password? password,
    Username? name,
    ConfirmedPassword? confirmedPassword,
    String? errorMessage,
  }) =>
      ProfileState(
        status: status ?? this.status,
        email: email ?? this.email,
        password: password ?? this.password,
        name: name ?? this.name,
        confirmedPassword: confirmedPassword ?? this.confirmedPassword,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        status,
        email,
        password,
        name,
        confirmedPassword,
        errorMessage,
      ];
}
