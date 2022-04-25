import 'package:cima_model/cima_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:treatment_repository/src/model/dose.dart';
import 'package:uuid/uuid.dart';

part 'treatment.g.dart';

@JsonSerializable(explicitToJson: true)
class Treatment extends Equatable {
  Treatment({
    String? id,
    required this.userId,
    required this.medicationId,
    required this.startDate,
    required this.endDate,
    required this.frequencyHours,
    List<Dose>? doses,
    this.medicamento,
  })  : id = id ?? const Uuid().v4(),
        doses = doses ?? [];

  factory Treatment.fromJson(Map<String, dynamic> json) =>
      _$TreatmentFromJson(json);

  final String id;
  final String userId;
  final String medicationId;
  @JsonKey(ignore: true)
  final Medicamento? medicamento;
  final DateTime startDate;
  final DateTime endDate;
  final int frequencyHours;
  final List<Dose> doses;

  Map<String, dynamic> toJson() => _$TreatmentToJson(this);

  @override
  List<Object?> get props => [
        id,
        userId,
        medicationId,
        startDate,
        endDate,
        frequencyHours,
        doses,
        medicamento,
      ];

  Treatment copyWith({
    String? userId,
    String? medicationId,
    DateTime? startDate,
    DateTime? endDate,
    int? frequencyHours,
    List<Dose>? doses,
    Medicamento? medicamento,
  }) {
    return Treatment(
      id: id,
      userId: userId ?? this.userId,
      medicationId: medicationId ?? this.medicationId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      frequencyHours: frequencyHours ?? this.frequencyHours,
      doses: doses ?? this.doses,
      medicamento: medicamento ?? this.medicamento,
    );
  }

  @override
  String toString() => 'Treatment { '
      'id: $id, '
      'userId: $userId, '
      'medicationId: $medicationId, '
      'startDate: $startDate, '
      'endDate: $endDate, '
      'frequencyHours: $frequencyHours'
      'doses: $doses, '
      'medicamento: $medicamento, '
      '}';
}
