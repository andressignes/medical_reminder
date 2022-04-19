// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Foto _$FotoFromJson(Map<String, dynamic> json) => Foto(
      tipo: $enumDecodeNullable(_$FotoTypeEnumMap, json['tipo']),
      url: json['url'] as String?,
      fecha: json['fecha'] as int?,
    );

Map<String, dynamic> _$FotoToJson(Foto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tipo', _$FotoTypeEnumMap[instance.tipo]);
  writeNotNull('url', instance.url);
  writeNotNull('fecha', instance.fecha);
  return val;
}

const _$FotoTypeEnumMap = {
  FotoType.materialAcondicionamentoSecundario: 'materialas',
  FotoType.formaFarmaceutica: 'formafarmac',
};
