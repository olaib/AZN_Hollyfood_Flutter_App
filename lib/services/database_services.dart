import 'package:azn_hollyfood_flutter_app/controllers/user_controller.dart';
import 'package:azn_hollyfood_flutter_app/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:azn_hollyfood_flutter_app/models/user/user_entity.dart';
import 'package:azn_hollyfood_flutter_app/utils/log.dart';
import 'package:azn_hollyfood_flutter_app/controllers/product_controller.dart';
import 'package:get_it/get_it.dart';


class DataBaseService {
  late final UserController _userController;
  late final ProductController _productController;

  DataBaseService() {
    FirebaseFirestore database = GetIt.I<FirebaseFirestore>();
    _userController = UserController(db: database);
    _productController = ProductController(db: database);
  }

  // user Entity
  Future<String> findOneOrCreate(UserEntity user) async {
    Log.info('Finding or creating user...');
    await _userController.findOneOrCreate(user);
    Log.info('User found or created successfully');
    return user.uid;
  }

  Future<void> createOrFoundProduct(Product product) async {
    // QuerySnapshot productSnapshot = await getProductByBarCode(product.barcode);
    // if (productSnapshot.docs.isEmpty) {
    //   return await createProduct(product);
    // } else {
    //   return productSnapshot.docs.first.id;
    // }
    await _productController.create(product);
  }

  Future<void> createOrUpdateUser(UserEntity user) async {
    // QuerySnapshot userSnapshot = await getUserByUsername(user.username);
    // if (userSnapshot.docs.isEmpty) {
    //   Log.info('user not found- creating...');
    //   return await createUser(user);
    // } else {
    //   await updateUser(user);
    //   Log.info('user found- updating...');
    //   return userSnapshot.docs.first.id;
    // }
    await _userController.createOrUpdate(user);
  }

  Future<String> createUser(UserEntity user) async {
    // create user with uid from db
    //generate unique uid
    // var docRef = await _db.collection(USERS_COLLECTION).add(user.toJson());
    // docRef.update({'uid': docRef.id});
    // return docRef.id;
    await _userController.create(user);
    return user.uid;
  }

  Future<void> createProduct(Product product) async {
    // var docRef =
    //     await _db.collection(PRODUCTS_COLLECTION).add(product.toDocument());
    // docRef.update({'uid': docRef.id});
    // return docRef.id;
    await _productController.create(product);
  }

  Future<UserEntity?> getUserByUsername(String username) async {
    // return _db
    //     .collection(USERS_COLLECTION)
    //     .where('username', isEqualTo: username)
    //     .get();
    return await _userController.getUserByUsername(username);
  }

  Future<List<Product?>> getProductByName(String name) async {
    // return _db
    //     .collection(PRODUCTS_COLLECTION)
    //     .where('name', isEqualTo: name)
    //     .get();
    return await _productController.getProductsByName(name);
  }

  Future<Product?> getProductByBarCode(String barcode) async {
    // return _db
    //     .collection(PRODUCTS_COLLECTION)
    //     .where('barcode', isEqualTo: barcode)
    //     .get();
    return await _productController.findOneByBarcode(barcode);
  }

  Future<UserEntity?> getUser(String id) async {
    // return await _db.collection(USERS_COLLECTION).doc(id).get();
    return await _userController.getById(id);
  }

  Future<void> updateUser(UserEntity user) async {
    // return await _db
    //     .collection(USERS_COLLECTION)
    //     .doc(user.uid)
    //     .update(user.toJson());
    await _userController.createOrUpdate(user);
  }

  Future<void> deleteUser(String uid) async {
    // return await _db.collection(USERS_COLLECTION).doc(uid).delete();
    await _userController.deleteById(uid);
  }

  //user last seen update
  Future<void> updateUserLastActive(String uid) async {
    // return await _db
    //     .collection(USERS_COLLECTION)
    //     .doc(uid)
    //     .update({'lastActive': DateTime.now().toUtc()});
    await _userController.updatelastActive(uid);
  }
  // ================== Admin ==================

  Future<UserEntity?> getAdmin(String username) async {
    // return await _db
    //     .collection(USERS_COLLECTION)
    //     .where('isAdmin', isEqualTo: true)
    //     .where('username', isEqualTo: email)
    //     .get();
    return await _userController.getUserByUsername(username);
  }

  Future<void> createAdmin(UserEntity admin) async {
    // var docRef = await _db.collection(USERS_COLLECTION).add(admin.toJson());
    // docRef.update({'isAdmin': true});
    // docRef.update({'uid': docRef.id});
    // return docRef.id;
    await _userController.createAdmin(admin);
  }

// getusers
  Future<List<UserEntity?>> getUsers() async {
    // var snapshots = await _db.collection(USERS_COLLECTION).get();
    // List<UserEntity?> users =
    //     snapshots.docs.map((e) => UserEntity.fromJson(e.data())).toList();
    // return users
    return await _userController.getAllUsers();
  }

  Future<List<Product?>> getProducts() async {
    // var snapshots = await _db.collection(PRODUCTS_COLLECTION).get();
    // List<Product?> products =
    //     snapshots.docs.map((e) => Product.fromJson(e.data())).toList();
    // return products;
    return await _productController.getAllProducts();
  }
}
