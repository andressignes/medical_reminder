import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;
import 'package:treatment_repository/src/model/model.dart';

const _collectionName = 'treatments';

/// {@template treatment_data_source}
/// Data Source which manages treatment of user.
/// {@endtemplate}
class TreatmentDataSource {
  /// {@macro treatment_data_source}
  TreatmentDataSource({
    cloud_firestore.CollectionReference? treatmentsCollection,
  }) : _treatmentsCollection = treatmentsCollection ??
            cloud_firestore.FirebaseFirestore.instance
                .collection(_collectionName);

  late final cloud_firestore.CollectionReference _treatmentsCollection;

  Future<void> addTreatment(Treatment treatment) async {
    try {
      log('TreatmentDataSource.addTreatment: ${treatment.toJson()}');
      await _treatmentsCollection.doc(treatment.id).set(treatment.toJson());
    } on cloud_firestore.FirebaseException catch (e) {
      log('FireStore Exception while adding treatment: ${e.code} ${e.message}');
    } catch (e) {
      log('Unknown Exception while adding treatment: $e');
    }
  }

  Future<void> deleteTreatment(String id) async {
    try {
      await _treatmentsCollection.doc(id).delete();
    } on cloud_firestore.FirebaseException catch (e) {
      log(
        'FireStore Exception while deleting treatment: ${e.code} ${e.message}',
      );
    } catch (e) {
      log('Unknown Exception while deleting treatment: $e');
    }
  }

  Future<void> updateTreatment(Treatment treatment) async {
    try {
      // log('TreatmentDataSource.updateTreatment: ${treatment.toJson()}');
      await _treatmentsCollection.doc(treatment.id).update(treatment.toJson());
    } on cloud_firestore.FirebaseException catch (e) {
      log(
        'FireStore Exception: updating treatment: ${e.code} - ${e.message}',
      );
    } catch (e) {
      log('Unknown Exception while updating treatment: $e');
    }
  }

  Future<Treatment?> getTreatment(String id) async {
    try {
      final doc = await _treatmentsCollection.doc(id).get();
      if (doc.exists && doc.data() != null) {
        return Treatment.fromJson(doc.data()! as Map<String, dynamic>);
      } else {
        return null;
      }
    } on cloud_firestore.FirebaseException catch (e) {
      log('FireStore Exception while adding user: ${e.code} ${e.message}');
      return null;
    } catch (e) {
      log('Unknown Exception while adding user: $e');
      return null;
    }
  }

  Stream<List<Treatment>> getTreatments(String userId) async* {
    try {
      final snapshot = _treatmentsCollection
          // .withConverter(
          //     fromFirestore: _fromFirestore, toFirestore: _toFirestore)
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map(
                  (doc) =>
                      Treatment.fromJson(doc.data()! as Map<String, dynamic>),
                )
                .toList(),
          );
      yield* snapshot;
    } on cloud_firestore.FirebaseException catch (e) {
      log('FireStore Exception while adding user: ${e.code} ${e.message}');
      yield List.empty();
    } catch (e) {
      log('Unknown Exception while adding user: $e');
      yield List.empty();
    }
  }

  Future<List<Treatment>> getTreatments2(String userId) async {
    final treatments = List<Treatment>.empty(growable: true);
    try {
      final snap = await _treatmentsCollection
          .withConverter(
            fromFirestore: _fromFirestore,
            toFirestore: _toFirestore,
          )
          .where('userId', isEqualTo: userId)
          .get();
      snap.docs.map(
        (doc) {
          if (doc.data() != null) {
            treatments.add(doc.data()!);
          }
        },
      ).toList();
      log('TreatmentDataSource.getTreatments2: ${treatments.length}');
      return treatments;
    } on cloud_firestore.FirebaseException catch (e) {
      log('FireStore Exception while adding user: ${e.code} ${e.message}');
      return treatments;
    } catch (e) {
      log('Unknown Exception while adding user: $e');
      return treatments;
    }
  }

  Treatment? _fromFirestore(
    cloud_firestore.DocumentSnapshot<Map<String, dynamic>> snapshot,
    cloud_firestore.SnapshotOptions? options,
  ) {
    if (!snapshot.exists || snapshot.data() == null) return null;
    return Treatment.fromJson(snapshot.data()!);
  }

  Map<String, Object?> _toFirestore(
    Treatment? value,
    cloud_firestore.SetOptions? options,
  ) {
    if (value == null) return {};
    return value.toJson();
  }
}
