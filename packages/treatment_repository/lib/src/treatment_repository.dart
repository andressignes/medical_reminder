import 'package:treatment_repository/src/data_source/data_source.dart';
import 'package:treatment_repository/src/model/model.dart';

class TreatmentRepository {
  TreatmentRepository({
    TreatmentDataSource? dataSource,
  }) : _dataSource = dataSource ?? TreatmentDataSource();

  final TreatmentDataSource _dataSource;

  Future<void> addTreatment(Treatment treatment) =>
      _dataSource.addTreatment(treatment);

  Future<void> deleteTreatment(String id) => _dataSource.deleteTreatment(id);

  Future<void> updateTreatment(Treatment treatment) =>
      _dataSource.updateTreatment(treatment);

  Stream<List<Treatment>> getTreatments(String userId) =>
      _dataSource.getTreatments(userId);

  Future<List<Treatment>> getTreatments2(String userId) =>
      _dataSource.getTreatments2(userId);

}
