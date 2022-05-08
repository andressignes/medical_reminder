import 'dart:convert';
import 'dart:io';

import 'package:cima_repository/cima_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockCimaApiClient extends Mock implements CimaApiClient {}

void main() {
  group('CIMA Repository', () {
    late final MockCimaApiClient apiClient;
    setUpAll(() {
      apiClient = MockCimaApiClient();
    });

    test('instantiate repository', () {
      expect(CimaRepository(remoteDataSource: apiClient), isNotNull);
    });

    group('getMedicamento', () {
      const cn = '712729';
      const nRegistro = '51347';
      final medicamentoJson =
          File('test/data/medicamento_cn_712729.json').readAsStringSync();
      setUpAll(() {
        when(() => apiClient.getMedicationByCN(cn))
            .thenAnswer((_) async => Response(medicamentoJson, 200));
        when(() => apiClient.getMedicationByNRegistro(nRegistro))
            .thenAnswer((_) async => Response(medicamentoJson, 200));
      });

      test('without parameters', () async {
        final repository = CimaRepository(remoteDataSource: apiClient);
        final medication = await repository.getMedicamento();
        expect(medication.isLeft(), isTrue);
        expect(
          medication,
          equals(
            Left<Failure, Medicamento>(
              ServerFailure(),
            ),
          ),
        );
      });

      test('get by CN', () async {
        final repository = CimaRepository(remoteDataSource: apiClient);
        final result = await repository.getMedicamento(cn: cn);
        expect(result.isRight(), true);
        expect(
          result,
          Right<Failure, Medicamento>(
            Medicamento.fromJson(
              jsonDecode(medicamentoJson) as Map<String, dynamic>,
            ),
          ),
        );
      });

      test('get by nRegistro', () async {
        final repository = CimaRepository(remoteDataSource: apiClient);
        final result = await repository.getMedicamento(nregistro: nRegistro);
        expect(result.isRight(), true);
        expect(
          result,
          Right<Failure, Medicamento>(
            Medicamento.fromJson(
              jsonDecode(medicamentoJson) as Map<String, dynamic>,
            ),
          ),
        );
      });

      test('get by nRegistro', () async {
        final repository = CimaRepository(remoteDataSource: apiClient);
        final result = await repository.getMedicamento(nregistro: nRegistro);
        expect(result.isRight(), true);
        expect(
          result,
          Right<Failure, Medicamento>(
            Medicamento.fromJson(
              jsonDecode(medicamentoJson) as Map<String, dynamic>,
            ),
          ),
        );
      });

      test('Status Code Error', () async {
        when(() => apiClient.getMedicationByCN(cn))
            .thenAnswer((_) async => Response('', 404));
        final repository = CimaRepository(remoteDataSource: apiClient);
        final result = await repository.getMedicamento(cn: cn);
        expect(result.isLeft(), true);
        expect(result, Left<Failure, Medicamento>(ServerFailure()));
      });
    });

    group('Find Medication', () {
      late Map<String, String> params;

      setUp(() async {
        params = {'nombre': 'aspirina'};
      });
      test('find without params', () async {
        when(apiClient.getMedications)
            .thenAnswer((_) async => Response('', 204));
        final repository = CimaRepository(remoteDataSource: apiClient);
        final result = await repository.findMedications();
        expect(result, Left<Failure, Medicamento>(NoDataFailure()));
      });

      test('find by name', () async {
        late final String medicamentoRAW;
        late final Map<String, dynamic> medicamentoJson;
        final listMedicamentos = <Medicamento>[];
        medicamentoRAW =
            await File('test/data/medicamento.json').readAsString();
        medicamentoJson = jsonDecode(medicamentoRAW) as Map<String, dynamic>;
        final cimaPaginado = CimaPaginado.fromJson(medicamentoJson);
        if (cimaPaginado.resultados != null) {
          listMedicamentos.addAll(
            cimaPaginado.resultados!.map<Medicamento>(
              Medicamento.fromJson,
            ),
          );
        }

        when(() => apiClient.getMedications(params: params))
            .thenAnswer((_) async => Response(medicamentoRAW, 200));

        final repository = CimaRepository(remoteDataSource: apiClient);
        final result = await repository.findMedications(params: params);
        expect(result.isRight(), true);
        expect(
          result.fold(
            (_) => null,
            (r) => r,
          ),
          listMedicamentos,
        );
      });
    });

    group('Find Problemas suministro', () {
      test('find problemas suministro without params', () async {
        final problemasSuministroRaw =
            await File('test/data/problemas_suministro.json').readAsString();
        final problemasSuministroJson =
            jsonDecode(problemasSuministroRaw) as Map<String, dynamic>;
        final cimaPaginado = CimaPaginado.fromJson(problemasSuministroJson);
        final resultados = cimaPaginado.resultados!;
        final problemasSuministro =
            resultados.map(ProblemaSuministro.fromJson).toList();

        when(() => apiClient.getProblemasSuministro(params: {}))
            .thenAnswer((_) async => Response(problemasSuministroRaw, 200));

        final repository = CimaRepository(remoteDataSource: apiClient);
        final result = await repository.findProblemasSuministro(params: {});
        expect(result.isRight(), true);
        expect(result.fold((_) => null, (r) => r), problemasSuministro);
      });

      test('find with params', () async {
        final params = {'nombre': 'aspirina'};
        final problemasSuministroRaw =
            await File('test/data/problemas_suministro.json').readAsString();
        final problemasSuministroJson =
            jsonDecode(problemasSuministroRaw) as Map<String, dynamic>;
        final cimaPaginado = CimaPaginado.fromJson(problemasSuministroJson);
        final resultados = cimaPaginado.resultados!;
        final problemasSuministro =
            resultados.map(ProblemaSuministro.fromJson).toList();
        when(() => apiClient.getProblemasSuministro(params: params))
            .thenAnswer((_) async => Response(problemasSuministroRaw, 200));
        final repository = CimaRepository(remoteDataSource: apiClient);
        final result = await repository.findProblemasSuministro(params: params);
        expect(result.isRight(), true);
        expect(
          result.fold(
            (l) => null,
            (r) => r,
          ),
          problemasSuministro,
        );
      });
    });
  });
}
