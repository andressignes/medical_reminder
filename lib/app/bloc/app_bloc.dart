import 'dart:async';
import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isEmpty
              ? const AppState.unauthenticated()
              : AppState.authenticated(authenticationRepository.currentUser),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    on<AppUserAttributesChanged>(_onUserAttributesChanged);
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(AppUserChanged(user)),
    );
    _userAttributesSubscription =
        _authenticationRepository.userAttributesStream.listen(
      (userAttributes) => add(AppUserAttributesChanged(userAttributes)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;
  late final StreamSubscription<User> _userAttributesSubscription;

  Future<void> _onUserChanged(
    AppUserChanged event,
    Emitter<AppState> emit,
  ) async {
    log('AppBloc._onUserChanged');
    event.user.isNotEmpty
        ? emit(
            AppState.authenticated(
              await _authenticationRepository.userAttributes,
            ),
          )
        : emit(const AppState.unauthenticated());
  }

  FutureOr<void> _onUserAttributesChanged(
    AppUserAttributesChanged event,
    Emitter<AppState> emit,
  ) async {
    log('AppBloc._onUserAttributesChanged');
    event.user.isNotEmpty
        ? emit(
            AppState.authenticated(
              await _authenticationRepository.userAttributes,
            ),
          )
        : emit(const AppState.unauthenticated());
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    _userAttributesSubscription.cancel();
    return super.close();
  }
}
