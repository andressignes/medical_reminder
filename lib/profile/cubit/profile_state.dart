part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.name = const Username.pure(),
    this.birthDate = const BirthDate.pure(),
    this.gender,
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.errorMessage,
  });

  final FormzStatus status;
  final Email email;
  final Password password;
  final Username name;
  final BirthDate birthDate;
  final Gender? gender;

  final ConfirmedPassword confirmedPassword;
  final String? errorMessage;

  ProfileState copyWith({
    FormzStatus? status,
    Email? email,
    Password? password,
    Username? name,
    BirthDate? birthDate,
    Gender? gender,
    ConfirmedPassword? confirmedPassword,
    String? errorMessage,
  }) =>
      ProfileState(
        status: status ?? this.status,
        email: email ?? this.email,
        password: password ?? this.password,
        name: name ?? this.name,
        birthDate: birthDate ?? this.birthDate,
        gender: gender ?? this.gender,
        confirmedPassword: confirmedPassword ?? this.confirmedPassword,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        status,
        email,
        password,
        name,
        birthDate,
        gender,
        confirmedPassword,
        errorMessage,
      ];
}
