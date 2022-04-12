import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Documento', () {
    late Map<String, dynamic> json;
    late Documento obj;

    setUp(() async {
      json = jsonDecode(
        File('test/resources/documento.json').readAsStringSync(),
      ) as Map<String, dynamic>;

      obj = Documento(
        tipo: TipoDocumento.fichaTecnica,
        url: json['url'] as String,
        secc: json['secc'] as bool,
      );
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
        const Documento(
              tipo: TipoDocumento.fichaTecnica,
              url: '',
              secc: true,
            ) ==
            const Documento(
              tipo: TipoDocumento.fichaTecnica,
              url: '',
              secc: true,
            ),
        isTrue,
      );
    });

    test('json serialization fromJson', () {
      expect(Documento.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
