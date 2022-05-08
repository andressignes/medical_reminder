// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter_test/flutter_test.dart';
import 'package:medical_reminder/app/app.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseAuthMock extends Mock implements firebase.FirebaseAuth {}

class UserDataSourceMock extends Mock implements UserDataSource {}

class AuthenticationRepositoryMock extends Mock
    implements AuthenticationRepository {
  @override
  User get currentUser => User.empty;

  @override
  Stream<User> get user => Stream.value(User.empty);

  @override
  Future<User> get userAttributes => Future.value(User.empty);

  @override
  Stream<User> get userAttributesStream => Stream.value(User.empty);
}

void main() {
  final _authRepository = AuthenticationRepositoryMock(

  );
  group('App', () {
    testWidgets('renders Home Page', (tester) async {
      await tester.pumpWidget(
        App(authenticationRepository: _authRepository),
      );
      // expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
