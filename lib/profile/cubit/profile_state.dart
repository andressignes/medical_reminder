part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.status = FormzStatus.pure,
    this.email = const EmailFormInput.pure(),
    this.password = const PasswordFormInput.pure(),
    this.name = const UsernameFormInput.pure(),
    this.birthDate = const BirthDateFormInput.pure(),
    this.gender,
    this.confirmedPassword = const ConfirmedPasswordFormInput.pure(),
    this.errorMessage,
  });

  final FormzStatus status;
  final EmailFormInput email;
  final PasswordFormInput password;
  final UsernameFormInput name;
  final BirthDateFormInput birthDate;
  final Gender? gender;

  final ConfirmedPasswordFormInput confirmedPassword;
  final String? errorMessage;

  ProfileState copyWith({
    FormzStatus? status,
    EmailFormInput? email,
    PasswordFormInput? password,
    UsernameFormInput? name,
    BirthDateFormInput? birthDate,
    Gender? gender,
    ConfirmedPasswordFormInput? confirmedPassword,
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
