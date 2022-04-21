import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'dose.g.dart';

@JsonSerializable()
class Dose extends Equatable {
  Dose({
    required this.treatmentId,
    required this.sheduledDateTime,
    this.intakeDateTime,
  }) : id = const Uuid().v4();

  factory Dose.fromJson(Map<String, dynamic> json) => _$DoseFromJson(json);

  final String id;
  final String treatmentId;
  final DateTime sheduledDateTime;
  final DateTime? intakeDateTime;

  Map<String, dynamic> toJson() => _$DoseToJson(this);

  @override
  List<Object?> get props => [
        id,
        treatmentId,
        sheduledDateTime,
        intakeDateTime,
      ];
}