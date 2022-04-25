import 'package:cima_repository/cima_repository.dart';
import 'package:treatment_repository/src/data_source/data_source.dart';
import 'package:treatment_repository/src/model/model.dart';

class TreatmentRepository {
  TreatmentRepository({
    TreatmentDataSource? dataSource,
    CimaRepository? cimaRepository,
  })  : _dataSource = dataSource ?? TreatmentDataSource(),
        _cimaRepository =
            cimaRepository ?? CimaRepository(remoteDataSource: CimaApiClient());

  final TreatmentDataSource _dataSource;
  final CimaRepository _cimaRepository;

  Future<void> addTreatment(Treatment treatment) =>
      _dataSource.addTreatment(treatment);

  Future<void> deleteTreatment(String id) => _dataSource.deleteTreatment(id);

  Future<void> updateTreatment(Treatment treatment) =>
      _dataSource.updateTreatment(treatment);

  Stream<List<Treatment>> getTreatments(String userId) =>
      _dataSource.getTreatments(userId);

  Future<List<Treatment>> getTreatments2(String userId) async {
    final treatments = <Treatment>[];
    for (final treatment in await _dataSource.getTreatments2(userId)) {
      final medication = await _cimaRepository.getMedicamento(
        nregistro: treatment.medicationId,
      );
      final t = medication.fold(
        (l) => treatment.copyWith(),
        (r) => treatment.copyWith(medicamento: r),
      );
      treatments.add(t);
    }
    return treatments;
  }
}
