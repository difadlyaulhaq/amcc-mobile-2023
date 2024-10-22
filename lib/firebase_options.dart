// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBs2gPyIjHkk5d79V3BZPAS_OqZeXtfvyg',
    appId: '1:430846783836:android:d64e7d1f3b6bd60b939199',
    messagingSenderId: '430846783836',
    projectId: 'testingintermediate',
    storageBucket: 'testingintermediate.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCyirPA_YVnhAcEybHqKK54F6nqdjJppe4',
    appId: '1:430846783836:ios:7d491c1330a8a1b1939199',
    messagingSenderId: '430846783836',
    projectId: 'testingintermediate',
    storageBucket: 'testingintermediate.appspot.com',
    iosBundleId: 'com.example.intermediateProject',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAREKsq5AA6qoIHt2MPda__dJgx259UNc0',
    appId: '1:430846783836:web:cf61c9fa9dd449dd939199',
    messagingSenderId: '430846783836',
    projectId: 'testingintermediate',
    authDomain: 'testingintermediate.firebaseapp.com',
    storageBucket: 'testingintermediate.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCyirPA_YVnhAcEybHqKK54F6nqdjJppe4',
    appId: '1:430846783836:ios:7d491c1330a8a1b1939199',
    messagingSenderId: '430846783836',
    projectId: 'testingintermediate',
    storageBucket: 'testingintermediate.appspot.com',
    iosBundleId: 'com.example.intermediateProject',
  );

}