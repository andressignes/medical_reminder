import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'treatment.g.dart';

@JsonSerializable()
class Treatment extends Equatable {
  Treatment({
    String? id,
    required this.userId,
    required this.medicationId,
    required this.startDate,
    required this.endDate,
    required this.frequencyHours,
  }) : id = id ?? const Uuid().v4();

  factory Treatment.fromJson(Map<String, dynamic> json) =>
      _$TreatmentFromJson(json);

  final String id;
  final String userId;
  final String medicationId;
  final DateTime startDate;
  final DateTime? endDate;
  final int frequencyHours;

  Map<String, dynamic> toJson() => _$TreatmentToJson(this);

  @override
  List<Object?> get props => [
        id,
        medicationId,
        startDate,
        endDate,
        frequencyHours,
      ];

  Treatment copyWith({
    String? userId,
    String? medicationId,
    DateTime? startDate,
    DateTime? endDate,
    int? frequencyHours,
  }) {
    return Treatment(
      id: id,
      userId: userId ?? this.userId,
      medicationId: medicationId ?? this.medicationId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      frequencyHours: frequencyHours ?? this.frequencyHours,
    );
  }

  @override
  String toString() => 'Treatment { '
      'id: $id, '
      'userId: $userId, '
      'medicationId: $medicationId, '
      'startDate: $startDate, '
      'endDate: $endDate, '
      'frequencyHours: $frequencyHours }';
}
