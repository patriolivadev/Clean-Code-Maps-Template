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
    apiKey: 'AIzaSyDe64MLLaCo8RKuFVh_JnWbiPZsW9EaD20',
    appId: '1:100477320045:web:2955528e23e2e5b1c7b864',
    messagingSenderId: '100477320045',
    projectId: 'stockmanager-5a814',
    authDomain: 'stockmanager-5a814.firebaseapp.com',
    storageBucket: 'stockmanager-5a814.appspot.com',
    measurementId: 'G-3XE0H4EF3T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBsuB1OFHousMV6TtpvOzIBKWSiFJgQoM0',
    appId: '1:100477320045:android:5a02a5b5db20a448c7b864',
    messagingSenderId: '100477320045',
    projectId: 'stockmanager-5a814',
    storageBucket: 'stockmanager-5a814.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRTpuqzvxsLzlM3qx6-qPmxdym9W7T1IE',
    appId: '1:100477320045:ios:4fa75bd75fed4280c7b864',
    messagingSenderId: '100477320045',
    projectId: 'stockmanager-5a814',
    storageBucket: 'stockmanager-5a814.appspot.com',
    iosBundleId: 'com.example.stockManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRTpuqzvxsLzlM3qx6-qPmxdym9W7T1IE',
    appId: '1:100477320045:ios:7c7cfc96da1978acc7b864',
    messagingSenderId: '100477320045',
    projectId: 'stockmanager-5a814',
    storageBucket: 'stockmanager-5a814.appspot.com',
    iosBundleId: 'com.example.stockManager.RunnerTests',
  );
}