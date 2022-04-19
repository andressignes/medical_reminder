// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Treatment _$TreatmentFromJson(Map<String, dynamic> json) => Treatment(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      medicationId: json['medicationId'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      frequencyHours: json['frequencyHours'] as int,
    );

Map<String, dynamic> _$TreatmentToJson(Treatment instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'medicationId': instance.medicationId,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'frequencyHours': instance.frequencyHours,
    };
