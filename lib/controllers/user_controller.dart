import 'package:azn_hollyfood_flutter_app/models/department.dart';
import 'package:azn_hollyfood_flutter_app/models/status.dart';
import 'package:azn_hollyfood_flutter_app/models/user/user_entity.dart';
import 'package:azn_hollyfood_flutter_app/repository/user_repo.dart';
import 'package:azn_hollyfood_flutter_app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController {
  final UserRepository _userRepo;
  List<Department> departments = [];
  List<Status> states = [];

  UserController(
      {
        String usersCollection = USERS_COLLECTION,
      String departmentsCollection = DEPARTMENTS_COLLECTION,
      required FirebaseFirestore db})
      : _userRepo = UserRepository(usersCollection, departmentsCollection, db) {
    _userRepo.getDepartments().then((value) => departments = value).then((_) {
      _userRepo.getStatuses().then((value) => states = value);
    });
  }
  Future<UserEntity?> createFromGSheet(List<dynamic> record) async {
    if (record.length != 8) {
      throw Exception('מספר השדות אינו תואם את מספר השדות הנדרש');
    }
    final index = departments.indexWhere((dep) => dep.name == record[3]);
    if(index == -1){
      throw Exception('מחלקה לא נמצאת');
    }
    final index2 = states.indexWhere((status) => status.name == record[4]);
    if(index2 == -1){
      throw Exception('סטטוס לא נמצא');
    }
    record[3] = departments[index];
    record[4] = states[index2];
    final user = UserEntity.fromSheets(record);
    await create(user);
    return user;
  }
  //DELETE BY ID
  Future<void> deleteById(String id) async {
    await _userRepo.deleteById(id);
  }

  Future<UserEntity?> findOneByUsername(String username) async {
    return await _userRepo.findOneByUsername(username);
  }

  Future<List<UserEntity?>> getUsersByUsername(String username) async {
    return await _userRepo.getUsersByUsername(username);
  }

  Future<List<UserEntity?>> getAdmins() async {
    return await getUsersByDepartment('מנהל');
  }

  Future<List<UserEntity?>> getUsersByDepartment(String department) async {
    return await _userRepo.getUsersByDepartment(department);
  }

  Future<List<UserEntity?>> getAllUsers() async {
    return await _userRepo.getAllUsers();
  }

  Future<void> findOneOrCreate(UserEntity user) async {
    await _userRepo.findOneOrCreate(user);
  }

  Future<UserEntity> updateLogin(UserEntity user) async {
    user = user.copyWith(
      lastActive: DateTime.now(),
      timePeriodStatus: 0,
      status: states.firstWhere((element) => element.name == 'בלוח משימות'),
    );
    await _userRepo.update(user.toDocument());
    return user;
  }

  // update the
  Future<UserEntity> updateExit(UserEntity user) async {
    user = user.copyWith(
      lastActive: DateTime.now(),
      timePeriodStatus: user.lastActive.difference(DateTime.now()).inMinutes,
      status: states.firstWhere((element) => element.name == 'בחוץ'),
    );
    await _userRepo.update(user.toDocument());
    return user;
  }

  Future<void> create(UserEntity user) async{
    UserEntity? userEntity = await findOneByUsername(user.username);
    if (userEntity != null) {
      throw Exception('משתמש כבר קיים');
    }
    final id = await _userRepo.create(user.toDocument());
    userEntity = user.copyWith(uid: id);
  }

  Future<void> createOrUpdate(UserEntity user) async {
    String id = await _userRepo.createOrUpdate(user.toDocument());
    user = user.copyWith(uid: id);
  }

  // getUserByUsername(String username) {}
  Future<UserEntity?> getUserByUsername(String username) async {
    return await _userRepo.findOneByUsername(username);
  }

  // getById(String id) {}
  Future<UserEntity?> getById(String id) async {
    return await _userRepo.getUserById(id);
  }

  // updatelastActive(String? uid) {}
  Future<void> updatelastActive(String uid) async {
    await _userRepo.updateLastActive(uid);
  }

  // createAdmin(UserEntity admin) {}
  Future<void> createAdmin(UserEntity admin) async {
    admin = admin.copyWith(
      department: departments.firstWhere((dep) => dep.name == 'מנהל'),
      status: states.firstWhere((element) => element.name == 'בלוח משימות'),
    );
    await create(admin);
  }
}
