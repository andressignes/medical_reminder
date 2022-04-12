import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Estado', () {
    late Map<String, dynamic> json;
    late Estado obj;

    setUp(() async {
      json = jsonDecode(
        File('test/resources/estado.json').readAsStringSync(),
      ) as Map<String, dynamic>;

      obj = Estado(
        aut: json['aut'] as int,
        rev: json['rev'] as int,
        susp: json['susp'] as int,
      );
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
        const Estado(
              aut: 1,
              rev: 2,
              susp: 3,
            ) ==
            const Estado(
              aut: 1,
              rev: 2,
              susp: 3,
            ),
        isTrue,
      );
    });

    test('json serialization fromJson', () {
      expect(Estado.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
