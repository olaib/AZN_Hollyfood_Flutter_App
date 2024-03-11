import 'package:azn_hollyfood_flutter_app/models/status.dart';
import 'package:azn_hollyfood_flutter_app/models/department.dart';
import 'package:azn_hollyfood_flutter_app/repository/firestore_repo.dart';
import 'package:azn_hollyfood_flutter_app/models/user/user_entity.dart';
import 'package:azn_hollyfood_flutter_app/utils/log.dart';

class UserRepository extends FirestoreRepositoryImpl {
  final FirestoreRepositoryImpl _departmentRepo;
  UserRepository(
      super.collectionName, String departmentsCollectionName, super.db)
      : _departmentRepo =
            FirestoreRepositoryImpl(departmentsCollectionName, db);

  Future<UserEntity?> findUserByField(String field, String value) async {
    await findOneByField(field, value).then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final docsRef = snapshot.docs.first;
        final Map<String, dynamic> userData =
            docsRef.data() as Map<String, dynamic>;
        userData["uid"] = docsRef.id;
        return UserEntity.fromJson(userData);
      }
    });
    return null;
  }

  Future<List<Department>> getDepartments() async {
    List<Department> departments = [];
    try {
      await  _departmentRepo.getAll().then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          departments =  snapshot.docs
              .map((doc) => Department.fromDocument(doc))
              .toList();
        }
      });
    } catch (e) {
      Log.error('Error getting all departments: $e');
    }
    return departments;
  }

  Future<List<Status>> getStatuses() async {
    try {
      await _departmentRepo.getAll().then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          return snapshot.docs.map((doc) => Status.fromDocument(doc)).toList();
        }
      });
    } catch (e) {
      Log.error('Error getting all departments: $e');
    }
    return [];
  }

  Future<List<UserEntity?>> getUsersByField(String field, String value) async {
    try {
      await getByField(field, value).then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          return snapshot.docs
              .map((doc) => UserEntity.fromDocument(doc))
              .toList();
        }
      });
    } catch (e) {
      Log.error('Error getting user by username: $e');
    }
    return [];
  }

  //find one user by username
  Future<UserEntity?> findOneByUsername(String username) async {
    return await findUserByField('username', username);
  }

  //find users by username
  Future<List<UserEntity?>> getUsersByUsername(String username) async {
    return await getUsersByField('username', username);
  }

  Future<List<UserEntity?>> getUsersByDepartment(String department) async {
    return await getUsersByField('department', department);
  }

  //get all users
  Future<List<UserEntity?>> getAllUsers() async {
    try {
      await getAll().then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          return snapshot.docs
              .map((doc) => UserEntity.fromDocument(doc))
              .toList();
        }
      });
    } catch (e) {
      Log.error('Error getting all users: $e');
    }
    return [];
  }

  //get user by id
  Future<UserEntity?> getUserById(String id) async {
    try {
      await getById(id).then((snapshot) {
        if (snapshot.exists) {
          return UserEntity.fromDocument(snapshot);
        }
      });
    } catch (e) {
      Log.error('Error getting user by id: $e');
    }
    return null;
  }

  // findOneOrCreate}
  Future<void> findOneOrCreate(UserEntity user) async {
    try {
      await findOneByUsername(user.username).then((foundUser) async {
        if (foundUser == null) {
          await create(user.toDocument());
        }
      });
    } catch (e) {
      Log.error('Error finding or creating user: $e');
    }
  }

  Future<void> updateLastActive(String uid) async {
    try {
      await getById(uid).then((snapshot) {
        if (snapshot.exists) {
          var user = UserEntity.fromDocument(snapshot);
          user = user.copyWith(lastActive: DateTime.now());
          update(user.toDocument());
        }
      });
    } catch (e) {
      Log.error('Error updating last active: $e');
    }
  }
}
