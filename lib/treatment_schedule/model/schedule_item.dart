import 'package:cima_repository/cima_repository.dart';
import 'package:dose_repository/dose_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:treatment_repository/treatment_repository.dart';

class ScheduleItem extends Equatable {
  const ScheduleItem({
    required this.treatment,
    this.medication,
    this.doses = const <Dose>[],
  });

  final Treatment treatment;
  final Medicamento? medication;
  final List<Dose> doses;

  @override
  List<Object?> get props => [treatment, medication, doses];

  ScheduleItem copyWith({
    Treatment? treatment,
    Medicamento? medication,
    List<Dose>? doses,
  }) {
    return ScheduleItem(
      treatment: treatment ?? this.treatment,
      medication: medication ?? this.medication,
      doses: doses ?? this.doses,
    );
  }
}
