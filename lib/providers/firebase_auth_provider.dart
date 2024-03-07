// import 'package:get_it/get_it.dart';
// import 'package:flutter/material.dart'; 
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:azn_hollyfood_flutter_app/utils/log.dart';
// import 'package:azn_hollyfood_flutter_app/models/user_entity.dart';
// import 'package:azn_hollyfood_flutter_app/utils/constants.dart';
// import 'package:azn_hollyfood_flutter_app/services/database_services.dart';
// import 'package:azn_hollyfood_flutter_app/excepions/custom_exceptions.dart';


// class AuthenticationProvider with ChangeNotifier {
//   late FirebaseAuth _firebaseAuth;
//   late DataBaseService _db;
//   bool isAnynomous = false;

//   UserEntity? _user; //this could be admin or user so one inheret from the other

//   bool get isUserLoggedIn => _firebaseAuth.currentUser != null;
//   bool get isUserAdmin => _user!.isAdmin;

//   AuthenticationProvider() {
//     _firebaseAuth = FirebaseAuth.instance;
//     _navigationService = GetIt.instance.get<NavigationService>();
//     _db = GetIt.instance.get<DataBaseService>();

//     _firebaseAuth.authStateChanges().listen((User? user) async {
//       if (_user != null) {
//         await _db.updateUserLastActive(_user!.uid!).onError(
//             (error, stackTrace) =>
//                 throw LoginException(UPDATE_LAST_ACTIVE_ERROR));
//         await _db.getUserByUsername(_user!.username).then((snapshot) {
//           final Map<String, dynamic> userData =
//               snapshot.docs.first.data() as Map<String, dynamic>;
//           userData["uid"] = _user!.uid;
//           _user = UserEntity.fromJson(userData);
//           _navigationService.removeAndNavigateTo(
//               (_user!.isAdmin) ? Routes.adminPanel : Routes.home);
//         });
//       } else if (_navigationService.currentRoute !=
//           NavigationService.getRoute(Routes.initialRoute)) {
//         _navigationService.removeAndNavigateTo(Routes.initialRoute);
//       }
//     });
//   }

//   /// Sign in with username and password
//   /// 1. check if user/admin exists
//   /// 2. check if password match
//   /// 3. login success - update user
//   /// 4. the auth state will be updated later @see _firebaseAuth.authStateChanges()
//   /// @param username: String - the username
//   /// @param password: String - the password
//   /// @param isAdmin: bool - if the user is admin
//   /// @exception LoginException
//   /// @return Future<void>
//   Future<void> sigInWithUsernameAndPassword(
//       {required String username,
//       required String password,
//       required bool isAdmin}) async {
//     try {
//       Log.logDebug(
//           'isAdmin: looking for ${isAdmin ? 'admin' : 'user'} with username: $username ...');
//       await (isAdmin ? _db.getAdmin(username) : _db.getUserByUsername(username))
//           .then((snapshot) {
//         // check if exists
//         if (snapshot.docs.isNotEmpty) {
//           final Map<String, dynamic> userData =
//               snapshot.docs.first.data() as Map<String, dynamic>;
//           Log.logDebug('userData: $userData');

//           final user = UserEntity.fromJson(userData);
//           // if password match
//           if (user.password == password) {
//             _user = user; // login success
//             Log.logDebug('user: $_user');

//             _firebaseAuth.signInAnonymously();
//             Log.logInfo('signed in anonymously');
//           } else {
//             throw LoginException(PASSWORD_NOT_MATCH);
//           }
//         } else {
//           throw LoginException(isAdmin ? ADMIN_NOT_FOUND : USER_NOT_FOUND);
//         }
//       });
//     } on FirebaseAuthException catch (e) {
//       // anynomoys firebase auth exception
//       throw LoginException(FIREBASE_AUTH_MAP[e.code] ?? UNKNOWN_ERROR);
//     } catch (e) {
//       Log.logError('login Error: $e');
//       throw LoginException(e.toString());
//     }
//   }

//   Future<void> sigInAsUser(
//       {required String username, required String password}) async {
//     await sigInWithUsernameAndPassword(
//         username: username, password: password, isAdmin: false);
//   }

//   Future<void> sigInAsAdmin(
//       {required String username, required String password}) async {
//     await sigInWithUsernameAndPassword(
//         username: username, password: password, isAdmin: true);
//   }

//   Future<void> signInWithEmailAndPassword(
//       {required String email, required String password}) async {
//     try {
//       Log.logDebug('loging as App manager: email: $email, password: $password');
//       await _firebaseAuth.signInWithEmailAndPassword(
//           email: email, password: password);
//       Log.logInfo('signed in Successfully');
//     } on FirebaseAuthException catch (e) {
//       Log.logError('login Error: ${e.code}');
//       throw LoginException(FIREBASE_AUTH_MAP[e.code] ?? UNKNOWN_ERROR);
//     } catch (e) {
//       Log.logError('login Error: $e');
//       throw LoginException(e.toString());
//     }
//   }

//   Future<String?>? resetAdminPassword(String email) async {
//     try {
//       await _firebaseAuth.sendPasswordResetEmail(email: email);
//       return PASSWORD_RESET_LINK_SENT;
//     } on FirebaseAuthException catch (e) {
//       return FIREBASE_AUTH_MAP[e.code] ?? UNKNOWN_ERROR;
//     } catch (e) {
//       return UNKNOWN_ERROR;
//     }
//   }

//   Future<void> signOut() async {
//     try {
//       await _firebaseAuth.signOut();
//       _user = null;
//     } on FirebaseAuthException catch (e) {
//       throw LogoutException(FIREBASE_AUTH_MAP[e.code] ?? UNKNOWN_ERROR);
//     }
//   }
// }
