import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:azn_hollyfood_flutter_app/models/user_entity.dart';
import 'package:azn_hollyfood_flutter_app/utils/log.dart';

const String USERS_COLLECTION = 'users';

class DataBaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DataBaseService() {}
  // user Entity
  Future<String> createOrFoundUser(UserEntity user) async {
    QuerySnapshot userSnapshot = await getUserByUsername(user.username);
    if (userSnapshot.docs.isEmpty) {
      return await createUser(user);
    } else {
      return userSnapshot.docs.first.id;
    }
  }

  Future<String> createOrUpdateUser(UserEntity user) async {
    QuerySnapshot userSnapshot = await getUserByUsername(user.username);
    if (userSnapshot.docs.isEmpty) {
      Log.info('user not found- creating...');
      return await createUser(user);
    } else {
      // updateUser(user);
      Log.info('user found- updating...');
      return userSnapshot.docs.first.id;
    }
  }

  Future<String> createUser(UserEntity user) async {
    // create user with uid from db
    //generate unique uid
    var docRef = await _db.collection(USERS_COLLECTION).add(user.toJson());
    docRef.update({'uid': docRef.id});
    return docRef.id;
  }

  Future<QuerySnapshot> getUserByUsername(String username) async {
    return _db
        .collection(USERS_COLLECTION)
        .where('username', isEqualTo: username)
        .get();
  }

  Future<DocumentSnapshot> getUser(String id) async {
    return await _db.collection(USERS_COLLECTION).doc(id).get();
  }

  Future<void> updateUser(UserEntity user) async {
    return await _db
        .collection(USERS_COLLECTION)
        .doc(user.uid)
        .update(user.toJson());
  }

  Future<void> deleteUser(String uid) async {
    return await _db.collection(USERS_COLLECTION).doc(uid).delete();
  }

  //user last seen update
  Future<void> updateUserLastActive(String? uid) async {
    return await _db
        .collection(USERS_COLLECTION)
        .doc(uid)
        .update({'lastActive': DateTime.now().toUtc()});
  }
  // ================== Admin ==================

  Future<QuerySnapshot> getAdmin(String email) async {
    return await _db
        .collection(USERS_COLLECTION)
        .where('isAdmin', isEqualTo: true)
        .where('username', isEqualTo: email)
        .get();
  }

  Future<String> createAdmin(UserEntity admin) async {
    var docRef = await _db.collection(USERS_COLLECTION).add(admin.toJson());
    docRef.update({'isAdmin': true});
    docRef.update({'uid': docRef.id});
    return docRef.id;
  }

// getusers
  Future<List<UserEntity?>> getUsers() async {
    var snapshots = await _db.collection(USERS_COLLECTION).get();
    List<UserEntity?> users =
        snapshots.docs.map((e) => UserEntity.fromJson(e.data())).toList();
    return users;
  }
}
