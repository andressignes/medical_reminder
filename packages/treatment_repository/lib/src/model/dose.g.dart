// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dose _$DoseFromJson(Map<String, dynamic> json) => Dose(
      id: json['id'] as String?,
      treatmentId: json['treatmentId'] as String,
      scheduledDateTime: DateTime.parse(json['scheduledDateTime'] as String),
      intakeDateTime: json['intakeDateTime'] == null
          ? null
          : DateTime.parse(json['intakeDateTime'] as String),
    );

Map<String, dynamic> _$DoseToJson(Dose instance) => <String, dynamic>{
      'id': instance.id,
      'treatmentId': instance.treatmentId,
      'scheduledDateTime': instance.scheduledDateTime.toIso8601String(),
      'intakeDateTime': instance.intakeDateTime?.toIso8601String(),
    };
