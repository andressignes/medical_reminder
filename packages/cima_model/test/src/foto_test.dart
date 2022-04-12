import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Foto', () {
    late Map<String, dynamic> json;
    late Foto obj;

    setUp(() async {
      json = jsonDecode(
        File('test/resources/foto.json').readAsStringSync(),
      ) as Map<String, dynamic>;

      obj = Foto(
        tipo: json['tipo'] as String,
        url: json['url'] as String,
        fecha: json['fecha'] as int,
      );
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
        const Foto(
              tipo: 'tipo',
              url: 'url',
              fecha: 1,
            ) ==
            const Foto(
              tipo: 'tipo',
              url: 'url',
              fecha: 1,
            ),
        isTrue,
      );
    });

    test('json serialization fromJson', () {
      expect(Foto.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
