import 'dart:convert';
import 'dart:io';

import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group('CIMA Paginado', () {
    late final CimaPaginado cimaPaginadoObj;
    late final Map<String, dynamic> cimaPaginadoJson;
    setUpAll(() async {
      cimaPaginadoJson = jsonDecode(
        File('test/resources/cima_paginado.json').readAsStringSync(),
      ) as Map<String, dynamic>;
      cimaPaginadoObj = CimaPaginado(
        pagina: cimaPaginadoJson['pagina'] as int,
        resultados: cimaPaginadoJson['resultados'] as List<dynamic>,
        tamanioPagina: cimaPaginadoJson['tamanioPagina'] as int,
        totalFilas: cimaPaginadoJson['totalFilas'] as int,
      );
    });

    test('can be instantiated', () {
      expect(const CimaPaginado(), isNotNull);
    });

    test('supports value comparisons', () {
      expect(
          CimaPaginado(
                pagina: 1,
                resultados: List<dynamic>.empty(growable: true),
                tamanioPagina: 25,
                totalFilas: 100,
              ) ==
              CimaPaginado(
                pagina: 1,
                resultados: List<dynamic>.empty(growable: true),
                tamanioPagina: 25,
                totalFilas: 100,
              ),
          isTrue,);
    });

    test('json serialization fromJson', () {
      expect(CimaPaginado.fromJson(cimaPaginadoJson), cimaPaginadoObj);
    });

    test('json serialization toJson', () {
      expect(cimaPaginadoObj.toJson(), cimaPaginadoJson);
    });
  });
}
