// ignore_for_file: prefer_const_constructors
import 'package:cima_repository/cima_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:treatment_repository/treatment_repository.dart';

class MockCimaRepository extends Mock implements CimaRepository {}

class MockTreatmentDataSource extends Mock implements TreatmentDataSource {}

void main() {
  final _cimaRepository = MockCimaRepository();
  final _treatmentDataSource = MockTreatmentDataSource();
  group('TreatmentRepository', () {
    test('can be instantiated', () {
      expect(
        TreatmentRepository(
          cimaRepository: _cimaRepository,
          dataSource: _treatmentDataSource,
        ),
        isNotNull,
      );
    });
  });
}
