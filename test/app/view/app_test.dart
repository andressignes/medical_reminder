// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medical_reminder/app/app.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class UserDataSourceMock extends Mock implements UserDataSource {}

void main() {
  group('App', () {
    final firebaseAuth = FirebaseAuthMock();
    final userDataSource = UserDataSourceMock();
    testWidgets('renders Home Page', (tester) async {
      await tester.pumpWidget(
        App(
          authenticationRepository: AuthenticationRepository(
            firebaseAuth: firebaseAuth,
            userDataSource: userDataSource,
          ),
        ),
      );
      // expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
