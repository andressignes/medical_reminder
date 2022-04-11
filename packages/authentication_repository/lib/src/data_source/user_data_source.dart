import 'dart:developer';

import 'package:authentication_repository/src/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;

/// {@template user_data_source}
/// Data Source which manages user data.
/// {@endtemplate}
class UserDataSource {
  /// {@macro user_data_source}
  UserDataSource({
    cloud_firestore.CollectionReference? usersCollection,
  }) : _usersCollection = usersCollection ??
            cloud_firestore.FirebaseFirestore.instance.collection('users');

  late final cloud_firestore.CollectionReference _usersCollection;

  Future<void> addUser(User user) async {
    try {
      await _usersCollection.doc(user.id).set(user.toJson());
    } on cloud_firestore.FirebaseException catch (e) {
      log('FireStore Exception while adding user: ${e.code} ${e.message}');
    } catch (e) {
      log('Unknown Exception while adding user: $e');
    }
  }

  Future<void> deleteUser(User user) async {
    try {
      await _usersCollection.doc(user.id).delete();
    } on cloud_firestore.FirebaseException catch (e) {
      log('FireStore Exception while adding user: ${e.code} ${e.message}');
    } catch (e) {
      log('Unknown Exception while adding user: $e');
    }
  }

  Future<void> updateUser(User user) async {
    try {
      await _usersCollection.doc(user.id).update(user.toJson());
    } on cloud_firestore.FirebaseException catch (e) {
      log('FireStore Exception while adding user: ${e.code} ${e.message}');
    } catch (e) {
      log('Unknown Exception while adding user: $e');
    }
  }

  Future<User> getCurrentUser(String id) async {
    try {
      final doc = await _usersCollection.doc(id).get();
      return User.fromJson(doc.data() as Map<String, dynamic>);
    } on cloud_firestore.FirebaseException catch (e) {
      log('FireStore Exception while adding user: ${e.code} ${e.message}');
      return User.empty;
    } catch (e) {
      log('Unknown Exception while adding user: $e');
      return User.empty;
    }
  }

  Stream<User> getUser(String id) async* {
    try {
      final snapshot = _usersCollection
          .doc(id)
          .withConverter<User>(
            fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          )
          .snapshots()
          .map((event) => event.data() ?? User.empty);
      yield* snapshot;
    } on cloud_firestore.FirebaseException catch (e) {
      log('FireStore Exception while adding user: ${e.code} ${e.message}');
      yield User.empty;
    } catch (e) {
      log('Unknown Exception while adding user: $e');
      yield User.empty;
    }
  }
}
