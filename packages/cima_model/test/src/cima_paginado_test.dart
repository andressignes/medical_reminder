import 'package:cima_model/cima_model.dart';
import 'package:test/test.dart';

void main() {
  group(
    'CIMA Paginado',
    () {
      test('can be instantiated', () {
        expect(const CimaPaginado(), isNotNull);
      });

      test('supports value comparisons', () {
        expect(
          CimaPaginado(
                pagina: 1,
                resultados: List<Map<String, dynamic>>.empty(growable: true),
                tamanioPagina: 25,
                totalFilas: 100,
              ) ==
              CimaPaginado(
                pagina: 1,
                resultados: List<Map<String, dynamic>>.empty(growable: true),
                tamanioPagina: 25,
                totalFilas: 100,
              ),
          isTrue,
        );
      });
    },
  );
}
