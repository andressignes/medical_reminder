import 'package:dose_repository/dose_repository.dart';

class DoseRepository {
  DoseRepository({
    DoseDataSource? doseDataSource,
  }) : _dataSource = doseDataSource ?? DoseDataSource();

  final DoseDataSource _dataSource;

  Future<void> addDose(Dose dose) async {
    await _dataSource.addDose(dose);
  }

  Future<void> deleteDose(Dose dose) async {
    await _dataSource.deleteDose(dose);
  }

  Future<void> updateDose(Dose dose) async {
    await _dataSource.updateDose(dose);
  }

  Future<List<Dose>> getDoses(String treatmentId) async {
    return _dataSource.getDoses(treatmentId);
  }
}
