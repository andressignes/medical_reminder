import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'foto.g.dart';

enum FotoType {
  @JsonValue('materialas')
  materialAcondicionamentoSecundario,
  @JsonValue('formafarmac')
  formaFarmaceutica,
}

enum FotoSize { thumbnails, full }

@JsonSerializable()
class Foto extends Equatable {
  const Foto({this.tipo, this.url, this.fecha});

  factory Foto.fromJson(Map<String, dynamic> json) => _$FotoFromJson(json);

  final FotoType? tipo;
  final String? url;
  final int? fecha;

  String? get urlFull => url != null
      ? url!.replaceAll(FotoSize.thumbnails.name, FotoSize.full.name)
      : null;

  String? get urlThumbnails => url != null
      ? url!.replaceAll(FotoSize.full.name, FotoSize.thumbnails.name)
      : null;

  Map<String, dynamic> toJson() => _$FotoToJson(this);

  @override
  List<Object?> get props => [tipo, url, fecha];
}
