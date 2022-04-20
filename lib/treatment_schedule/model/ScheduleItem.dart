import 'package:cima_repository/cima_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_reminder/treatment_schedule/model/dodes.dart';
import 'package:treatment_repository/treatment_repository.dart';

class ScheduleItem extends Equatable {
  const ScheduleItem({
    required this.treatment,
    this.medication,
    this.doses = const <Doses>[],
  });

  final Treatment treatment;
  final Medicamento? medication;
  final List<Doses> doses;

  @override
  List<Object?> get props => [treatment, medication, doses];

  ScheduleItem copyWith({
    Treatment? treatment,
    Medicamento? medication,
    List<Doses>? doses,
  }) {
    return ScheduleItem(
      treatment: treatment ?? this.treatment,
      medication: medication ?? this.medication,
      doses: doses ?? this.doses,
    );
  }
}
