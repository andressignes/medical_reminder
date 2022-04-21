// ignore_for_file: prefer_const_constructors
import 'package:dose_repository/dose_repository.dart';
import 'package:test/test.dart';

void main() {
  group('DosesRepository', () {
    test('can be instantiated', () {
      expect(DoseRepository(), isNotNull);
    });
  });
}
