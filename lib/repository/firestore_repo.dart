// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';

/// FirestoreRepository is an base class for all Firestore repositories and it is used to perform CRUD operations on Firestore
abstract class FirestoreRepository{
  Future<QuerySnapshot> findOneByField(String field, String value);
  Future<String> create(Map<String, dynamic> item);
  Future<void> update(Map<String, dynamic> item);
  Future<DocumentSnapshot> getById(String id);
  Future<QuerySnapshot<Object?>> getAll();
  Future<void> createAll(List<Map<String, dynamic>> items);
  Future<void> updateAll(List<Map<String, dynamic>> items);
  Future<QuerySnapshot<Object?>> getByField(String field, String value);
  Future<void> deleteById(String id);
  Future<void> deleteAll();
  Future<String> createOrUpdate(Map<String, dynamic> item);
  Future<void> createOrUpdateAll(List<Map<String, dynamic>> items);
}

/// FirestoreRepositoryImpl is an implementation of FirestoreRepository
class FirestoreRepositoryImpl implements FirestoreRepository {
  final FirebaseFirestore _db;
  final String collectionName;

  FirestoreRepositoryImpl(this.collectionName, this._db);

  /// Get the collection reference
  /// @return CollectionReference
  /// @throws FirebaseException | Exception
  // ignore: non_constant_identifier_names
  CollectionReference get db_collection => _db.collection(collectionName);

  /// Find an item by specific field from the collection
  /// @param field - field name
  /// @param value - field value
  /// @return Future<QuerySnapshot>
  /// @throws FirebaseException | Exception
  @override
  Future<QuerySnapshot> findOneByField(String field, String value) async {
    var querySnapshot =
        await db_collection.where(field, isEqualTo: value).limit(1).get();
    return querySnapshot;
  }

  /// Add an item to the collection
  /// @param item - item to be added
  /// @return Future<void>
  /// @throws FirebaseException | Exception
  @override
  Future<String> create(Map<String, dynamic> item) async {
    return await db_collection.add(item).then((value) => value.id);
  }

  /// Update an item in the collection
  /// @param item - item to be updated
  /// @return Future<void>
  /// @throws FirebaseException | Exception
  @override
  Future<void> update(Map<String, dynamic> item) async {
    await db_collection
        .doc(item.toString())
        .update(item);
  }

  /// Get an item by id from the collection
  /// @param id - id of the item
  /// @return Future<DocumentSnapshot>
  /// @throws FirebaseException | Exception
  @override
  Future<DocumentSnapshot> getById(String id) async {
    DocumentSnapshot<Object?> snapshot = await db_collection.doc(id).get();
    return snapshot;
  }

  /// Get all items from the collection
  /// @return Future<List<QuerySnapshot>>
  /// @throws FirebaseException | Exception
  @override
  Future<QuerySnapshot<Object?>> getAll() async {
    QuerySnapshot<Object?> querySnapshot = await db_collection.get();
    return querySnapshot;
  }

  /// Add all items to the collection
  /// @param items - list of items to be added
  /// @return Future<void>
  /// @throws FirebaseException | Exception
  @override
  Future<void> createAll(List<Map<String, dynamic>> items) async {
    final WriteBatch batch = _db.batch();
    items.forEach((item) {
      batch.set(db_collection.doc(), item);
    });
    await batch.commit();
  }

  /// Update all items in the collection
  /// @param items - list of items to be updated
  /// @return Future<void>
  /// @throws FirebaseException | Exception
  @override
  Future<void> updateAll(List<Map<String, dynamic>> items) async {
    final WriteBatch batch = _db.batch();
    items.forEach((item) {
      batch.update(
          db_collection.doc(item.toString()), item as Map<String, dynamic>);
    });
    await batch.commit();
  }

  /// Get items by specific field from the collection
  /// @param field - field name
  /// @param value - field value
  /// @return Future<List<QuerySnapshot>>
  /// @throws FirebaseException | Exception
  @override
  Future<QuerySnapshot<Object?>> getByField(String field, String value) async {
    QuerySnapshot<Object?> querySnapshot =
        await db_collection.where(field, isEqualTo: value).get();
    return querySnapshot;
  }

  /// Delete an item by id from the collection
  /// @param id - id of the item
  /// @return Future<void>
  /// @throws FirebaseException | Exception
  @override
  Future<void> deleteById(String id) async {
    await db_collection.doc(id).delete();
  }

  /// Delete all items from the collection
  /// @return Future<void>
  /// @throws FirebaseException | Exception
  @override
  Future<void> deleteAll() async {
    final WriteBatch batch = _db.batch();
    var querySnapshot = await db_collection.get();
    querySnapshot.docs.forEach((doc) {
      batch.delete(doc.reference);
    });
    await batch.commit();
  }

  /// Create or update an item in the collection
  /// @param item - item to be created or updated
  /// @return Future<String> - id of the item
  /// @throws FirebaseException | Exception
  @override
  Future<String> createOrUpdate(Map<String, dynamic> item) async {
    var docRef = db_collection.doc(item['id']);
    var doc = await docRef.get();
    if (doc.exists) {
      await docRef.update(item);
    } else {
      await docRef.set(item);
    }
    return doc.id;
  }

  /// Create or update all items in the collection
  /// @param items - list of items to be created or updated
  /// @return Future<void>
  /// @throws FirebaseException | Exception
  @override
  Future<void> createOrUpdateAll(List items) {
    final WriteBatch batch = _db.batch();
    items.forEach((item) {
      var docRef = db_collection.doc(item.toString());
      batch.set(docRef, item);
    });
    return batch.commit();
  }
}

/// FirestoreRepositoryFactory is a factory class for creating FirestoreRepository
/// @param collectionName - name of the collection
/// @return FirestoreRepository
/// @throws FirebaseException | Exception
class FirestoreRepositoryFactory {
  static FirestoreRepository create(String collectionName, FirebaseFirestore db) {
    return FirestoreRepositoryImpl(collectionName,db);
  }
}

/// FirestoreRepositoryProvider is a provider class for FirestoreRepository
/// @param collectionName - name of the collection
/// @return FirestoreRepository
/// @throws FirebaseException | Exception
class FirestoreRepositoryProvider {
  static FirestoreRepository create(String collectionName, FirebaseFirestore db) {
    return FirestoreRepositoryFactory.create(collectionName, db);
  }
}
