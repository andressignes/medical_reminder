part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class AppLogoutRequested extends AppEvent {
  @override
  List<Object?> get props => [];
}

class AppUserChanged extends AppEvent {
  const AppUserChanged(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
}

class AppUserAttributesChanged extends AppEvent {
  const AppUserAttributesChanged(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
}
