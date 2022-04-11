import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const ProfileState());

  final AuthenticationRepository _authenticationRepository;

  void nameChanged(String name) {
    final username = Username.dirty(name);
    emit(
      state.copyWith(
        name: username,
        status: Formz.validate([username]),
      ),
    );
  }

  Future<void> save() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final currentUser = await _authenticationRepository.userAttributes;
      await _authenticationRepository.updateUserAttributes(
        currentUser.copyWith(
          name: state.name.value,
        ),
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
