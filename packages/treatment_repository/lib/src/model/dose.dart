import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'dose.g.dart';

@JsonSerializable()
class Dose extends Equatable {
  Dose({
    String? id,
    required this.treatmentId,
    required this.scheduledDateTime,
    this.intakeDateTime,
  }) : id = id ?? const Uuid().v4();

  factory Dose.fromJson(Map<String, dynamic> json) => _$DoseFromJson(json);

  final String? id;
  final String treatmentId;
  final DateTime scheduledDateTime;
  final DateTime? intakeDateTime;

  Map<String, dynamic> toJson() => _$DoseToJson(this);

  @override
  List<Object?> get props => [
        id,
        treatmentId,
        scheduledDateTime,
        intakeDateTime,
      ];

  Dose copyWith({
    String? id,
    String? treatmentId,
    DateTime? scheduledDateTime,
    DateTime? intakeDateTime,
  }) {
    return Dose(
      id: id ?? this.id,
      treatmentId: treatmentId ?? this.treatmentId,
      scheduledDateTime: scheduledDateTime ?? this.scheduledDateTime,
      intakeDateTime: intakeDateTime ?? this.intakeDateTime,
    );
  }
}
