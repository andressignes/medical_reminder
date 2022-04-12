import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart' show Item;
import 'package:test/test.dart';

void main() {
  group('Item', () {
    late Map<String, dynamic> json;
    late Item obj;

    setUp(() async {
      json = jsonDecode(
        File('test/resources/item.json').readAsStringSync(),
      ) as Map<String, dynamic>;

      obj = Item(
        id: json['id'] as int,
        codigo: json['codigo'] as String,
        nombre: json['nombre'] as String,
      );
    });

    test('can be instantiated', () {
      expect(const Item(), isNotNull);
    });

    test('supports value comparisons', () {
      expect(
        const Item(
              id: 1,
              codigo: 'abc123',
              nombre: '1',
            ) ==
            const Item(
              id: 1,
              codigo: 'abc123',
              nombre: '1',
            ),
        isTrue,
      );

      expect(
        const Item(
              id: 1,
              codigo: 'abc123',
              nombre: '1',
            ) ==
            const Item(
              id: 2,
              codigo: 'abc123',
              nombre: '1',
            ),
        isFalse,
      );
    });

    test('json serialization fromJson', () {
      expect(Item.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
