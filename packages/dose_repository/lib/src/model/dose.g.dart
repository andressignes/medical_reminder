// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dose _$DoseFromJson(Map<String, dynamic> json) => Dose(
      treatmentId: json['treatmentId'] as String,
      sheduledDateTime: DateTime.parse(json['sheduledDateTime'] as String),
      intakeDateTime: json['intakeDateTime'] == null
          ? null
          : DateTime.parse(json['intakeDateTime'] as String),
    );

Map<String, dynamic> _$DoseToJson(Dose instance) => <String, dynamic>{
      'treatmentId': instance.treatmentId,
      'sheduledDateTime': instance.sheduledDateTime.toIso8601String(),
      'intakeDateTime': instance.intakeDateTime?.toIso8601String(),
    };
