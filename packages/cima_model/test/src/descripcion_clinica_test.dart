import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('Descripcion Clinica', () {
    late Map<String, dynamic> json;
    late DescripcionClinica obj;

    setUp(() async {
      json = jsonDecode(
        File('test/resources/descripcion_clinica.json').readAsStringSync(),
      ) as Map<String, dynamic>;
      obj = DescripcionClinica(
        vmp: json['vmp'] as String,
        vmpDesc: json['vmpDesc'] as String,
        vmpp: json['vmpp'] as String,
        vmppDesc: json['vmppDesc'] as String,
        presComerc: json['presComerc'] as int,
      );
    });

    test('can be instantiated', () {
      expect(obj, isNotNull);
    });

    test('supports value comparisons', () {
      expect(
        const DescripcionClinica(
              vmp: '322246006',
              vmpDesc: 'Paracetamol 100 mg/ml solución/suspensión oral',
              vmpp: '18021000140104',
              vmppDesc:
                  'Paracetamol 100 mg/ml solución/suspensión oral 30 ml 1 frasco',
              presComerc: 2,
            ) ==
            const DescripcionClinica(
              vmp: '322246006',
              vmpDesc: 'Paracetamol 100 mg/ml solución/suspensión oral',
              vmpp: '18021000140104',
              vmppDesc:
                  'Paracetamol 100 mg/ml solución/suspensión oral 30 ml 1 frasco',
              presComerc: 2,
            ),
        isTrue,
      );
    });

    test('json serialization fromJson', () {
      expect(DescripcionClinica.fromJson(json), obj);
    });

    test('json serialization toJson', () {
      expect(obj.toJson(), json);
    });
  });
}
