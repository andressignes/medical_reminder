// ignore_for_file: prefer_const_constructors
import 'package:authentication_repository/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('User', () {
    const id = 'mock-id';
    const email = 'mock@email.test';

    test('uses value equality', () {
      expect(
        User(id: id, email: email),
        equals(User(id: id, email: email)),
      );
    });

    test('isEmpty return true for empty user', () {
      expect(User.empty.isEmpty, isTrue);
    });

    test('isEmpty return false for non-empty user', () {
      expect(
        User(id: id, email: email).isEmpty,
        isFalse,
      );
    });

    test('isNotEmpty return false for empty user', () {
      expect(
        User.empty.isNotEmpty,
        isFalse,
      );
    });

    test('isNotEmpty return true for non-empty user', () {
      expect(
        User(id: id, email: email).isNotEmpty,
        isTrue,
      );
    });

    test('json serialization', () {
      final birthDate = DateTime(2020);
      final user = User(
        id: id,
        email: email,
        gender: Gender.female,
        name: 'mock name',
        birthDate: birthDate,
      );
      final json = user.toJson();
      expect(json, {
        'id': id,
        'email': email,
        'name': 'mock name',
        'birthDate': birthDate.toIso8601String(),
        'gender': Gender.female.name,
      });
      expect(User.fromJson(json), user);
    });

    test('Gender user to spanish', () {
      for (final gender in Gender.values) {
        switch (gender) {
          case Gender.male:
            expect(gender.toSpanish, 'Hombre');
            break;
          case Gender.female:
            expect(gender.toSpanish, 'Mujer');
            break;
          case Gender.genderless:
            expect(gender.toSpanish, 'Sin Género');
            break;
        }
      }
    });

    test('copyWith', () {
      const user = User.empty;

      expect(user.copyWith(id: id).id, id);
      expect(user.copyWith(email: email).email, email);
      expect(user.copyWith(name: 'name').name, 'name');
      expect(
        user.copyWith(birthDate: DateTime(2020)).birthDate,
        DateTime(2020),
      );
    });
  });
}
