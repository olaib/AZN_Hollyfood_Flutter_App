// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDjlLK6zbWuLYgnqkwoEJLGixOIrFCEuug',
    appId: '1:461052837961:web:e077651b86ea2b009aff98',
    messagingSenderId: '461052837961',
    projectId: 'azn-flutter-app',
    authDomain: 'azn-flutter-app.firebaseapp.com',
    databaseURL: 'https://azn-flutter-app-default-rtdb.firebaseio.com',
    storageBucket: 'azn-flutter-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfddJC_FU7o3tvIn-GDRK-9ArHK0XH6z8',
    appId: '1:461052837961:android:be1f15dd84dd5ea99aff98',
    messagingSenderId: '461052837961',
    projectId: 'azn-flutter-app',
    databaseURL: 'https://azn-flutter-app-default-rtdb.firebaseio.com',
    storageBucket: 'azn-flutter-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSPcm9mxe3p3RqEHIDCZDBjN7g9u_XhZc',
    appId: '1:461052837961:ios:a90c09cece6be4b39aff98',
    messagingSenderId: '461052837961',
    projectId: 'azn-flutter-app',
    databaseURL: 'https://azn-flutter-app-default-rtdb.firebaseio.com',
    storageBucket: 'azn-flutter-app.appspot.com',
    iosBundleId: 'com.example.aznHollyfoodFlutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCSPcm9mxe3p3RqEHIDCZDBjN7g9u_XhZc',
    appId: '1:461052837961:ios:5caaefa72e9499139aff98',
    messagingSenderId: '461052837961',
    projectId: 'azn-flutter-app',
    databaseURL: 'https://azn-flutter-app-default-rtdb.firebaseio.com',
    storageBucket: 'azn-flutter-app.appspot.com',
    iosBundleId: 'com.example.aznHollyfoodFlutterApp.RunnerTests',
  );
}
