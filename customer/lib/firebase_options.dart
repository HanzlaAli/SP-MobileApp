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
        return windows;
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
    apiKey: 'AIzaSyBcMx8e_2HG05z3gSVM2YcRHB95EsH8ftk',
    appId: '1:693536033919:web:f0cfa60ca7d8abd717834a',
    messagingSenderId: '693536033919',
    projectId: 'mended-solutions',
    authDomain: 'mended-solutions.firebaseapp.com',
    storageBucket: 'mended-solutions.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQOua-wgdnSfcLLJejWZSmLtkLmW7SHA8',
    appId: '1:693536033919:android:85cadeb79847388817834a',
    messagingSenderId: '693536033919',
    projectId: 'mended-solutions',
    storageBucket: 'mended-solutions.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAK4CKyLDHyNAZLXqN5-JkDMx8P-H85HV0',
    appId: '1:693536033919:ios:73e9bd182943e04717834a',
    messagingSenderId: '693536033919',
    projectId: 'mended-solutions',
    storageBucket: 'mended-solutions.firebasestorage.app',
    iosBundleId: 'com.example.customer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAK4CKyLDHyNAZLXqN5-JkDMx8P-H85HV0',
    appId: '1:693536033919:ios:73e9bd182943e04717834a',
    messagingSenderId: '693536033919',
    projectId: 'mended-solutions',
    storageBucket: 'mended-solutions.firebasestorage.app',
    iosBundleId: 'com.example.customer',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBcMx8e_2HG05z3gSVM2YcRHB95EsH8ftk',
    appId: '1:693536033919:web:7d15a8da39f25ac017834a',
    messagingSenderId: '693536033919',
    projectId: 'mended-solutions',
    authDomain: 'mended-solutions.firebaseapp.com',
    storageBucket: 'mended-solutions.firebasestorage.app',
  );

}