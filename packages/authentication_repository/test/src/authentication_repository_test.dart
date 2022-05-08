// ignore_for_file: prefer_const_constructors
import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockUserDataSource extends Mock implements UserDataSource {}

void main() {
  final _auth = MockFirebaseAuth();
  final _userDataSource = MockUserDataSource();
  group('AuthenticationRepository', () {
    test('can be instantiated', () {
      expect(
        AuthenticationRepository(
          firebaseAuth: _auth,
          userDataSource: _userDataSource,
        ),
        isNotNull,
      );
    });
  });
}
