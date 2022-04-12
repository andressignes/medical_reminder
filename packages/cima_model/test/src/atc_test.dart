import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Atc', () {
    late Map<String, dynamic> atcJson;
    late Atc atcObj;

    setUp(() async {
      atcJson = jsonDecode(
        File('test/resources/atc.json').readAsStringSync(),
      ) as Map<String, dynamic>;

      atcObj = Atc(
        nombre: atcJson['nombre'] as String,
        codigo: atcJson['codigo'] as String,
        nivel: atcJson['nivel'] as int,
      );
    });

    test('can be instantiated', () {
      expect(atcObj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
        const Atc(codigo: '', nivel: 0, nombre: '') ==
            const Atc(codigo: '', nivel: 0, nombre: ''),
        isTrue,
      );
    });

    test('json serialization fromJson', () {
      expect(Atc.fromJson(atcJson), atcObj);
    });

    test('json serialization toJson', () {
      expect(atcObj.toJson(), atcJson);
    });
  });
}
