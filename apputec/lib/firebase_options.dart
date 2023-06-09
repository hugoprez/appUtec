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
    apiKey: 'AIzaSyCzfpBfyEiTz3Zzujrt13m5URZtnDZYpkM',
    appId: '1:78435083263:web:664c3ea8ced116b6153dca',
    messagingSenderId: '78435083263',
    projectId: 'bdschool-746b0',
    authDomain: 'bdschool-746b0.firebaseapp.com',
    databaseURL: 'https://bdschool-746b0-default-rtdb.firebaseio.com',
    storageBucket: 'bdschool-746b0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWpGxDBht7Ww9xVrt8dErojeR0Qin9ojg',
    appId: '1:78435083263:android:7079363e709d37d6153dca',
    messagingSenderId: '78435083263',
    projectId: 'bdschool-746b0',
    databaseURL: 'https://bdschool-746b0-default-rtdb.firebaseio.com',
    storageBucket: 'bdschool-746b0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCm_bxwkoPUCF2k2izYOKN1VNaVOA_86hA',
    appId: '1:78435083263:ios:f0494848fdcc47d3153dca',
    messagingSenderId: '78435083263',
    projectId: 'bdschool-746b0',
    databaseURL: 'https://bdschool-746b0-default-rtdb.firebaseio.com',
    storageBucket: 'bdschool-746b0.appspot.com',
    iosClientId: '78435083263-sii71o47m14peg24jddmvjk93veumrli.apps.googleusercontent.com',
    iosBundleId: 'com.example.apputec',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCm_bxwkoPUCF2k2izYOKN1VNaVOA_86hA',
    appId: '1:78435083263:ios:f0494848fdcc47d3153dca',
    messagingSenderId: '78435083263',
    projectId: 'bdschool-746b0',
    databaseURL: 'https://bdschool-746b0-default-rtdb.firebaseio.com',
    storageBucket: 'bdschool-746b0.appspot.com',
    iosClientId: '78435083263-sii71o47m14peg24jddmvjk93veumrli.apps.googleusercontent.com',
    iosBundleId: 'com.example.apputec',
  );
}
