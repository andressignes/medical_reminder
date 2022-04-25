import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;

import 'package:dose_repository/src/model/model.dart';

const _collectionName = 'doses';

class DoseDataSource {
  DoseDataSource({
    cloud_firestore.CollectionReference? collectionReference,
  }) : _collectionReference = collectionReference ??
            cloud_firestore.FirebaseFirestore.instance
                .collection(_collectionName);

  late final cloud_firestore.CollectionReference _collectionReference;

  Future<void> addDose(Dose dose) async {
    try {
      await _collectionReference.doc(dose.id).set(dose.toJson());
    } on cloud_firestore.FirebaseException catch (e) {
      log('Error adding dose: FirebaseException - ${e.message}');
    } catch (e) {
      log('Error adding dose: $e');
    }
  }

  Future<void> deleteDose(Dose dose) async {
    try {
      await _collectionReference.doc(dose.id).delete();
    } on cloud_firestore.FirebaseException catch (e) {
      log('Error deleting dose: FirebaseException - ${e.message}');
    } catch (e) {
      log('Error deleting dose: $e');
    }
  }

  Future<void> updateDose(Dose dose) async {
    try {
      log('Updating dose: ${dose.id}');
      await _collectionReference.doc(dose.id).set(dose.toJson());
    } on cloud_firestore.FirebaseException catch (e) {
      log('Error updating dose: FirebaseException - ${e.message}');
    } catch (e) {
      log('Error updating dose: $e');
    }
  }

  Future<Dose?> getDose(String id) async {
    try {
      final snapshot = await _collectionReference.doc(id).get();
      if (!snapshot.exists || snapshot.data() == null) {
        return null;
      }
      return Dose.fromJson(snapshot.data()! as Map<String, dynamic>);
    } on cloud_firestore.FirebaseException catch (e) {
      log('Error getting dose: FirebaseException - ${e.message}');
      return null;
    } catch (e) {
      log('Error getting dose: $e');
      return null;
    }
  }

  Future<List<Dose>> getDoses(String treatmentId) async {
    final doses = <Dose>[];
    try {
      final snapshot = await _collectionReference
          .withConverter(
            fromFirestore: _fromFirestore,
            toFirestore: _toFirestore,
          )
          .where('treatmentId', isEqualTo: treatmentId)
          .orderBy('scheduledDateTime')
          .get();
      snapshot.docs
          .map((doc) => doc.data() != null ? doses.add(doc.data()!) : null)
          .toList();
      return doses;
    } on cloud_firestore.FirebaseException catch (e) {
      log('Error getting doses: FirebaseException - ${e.message}');
      return doses;
    } catch (e) {
      log('Error getting doses: $e');
      return doses;
    }
  }

  Dose? _fromFirestore(
    cloud_firestore.DocumentSnapshot<Map<String, dynamic>> snapshot,
    cloud_firestore.SnapshotOptions? options,
  ) {
    if (snapshot.exists == false || snapshot.data() == null) return null;
    return Dose.fromJson(snapshot.data()!);
  }

  Map<String, Object?> _toFirestore(
    Dose? value,
    cloud_firestore.SetOptions? options,
  ) {
    if (value == null) return {};
    return value.toJson();
  }
}
