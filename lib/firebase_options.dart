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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAIJruQXAHUPPABkFgsqSyezyMPkVFA5TI',
    appId: '1:400266413597:web:079e8516fc607737b528f4',
    messagingSenderId: '400266413597',
    projectId: 'tharwat-chat-app',
    authDomain: 'tharwat-chat-app.firebaseapp.com',
    storageBucket: 'tharwat-chat-app.appspot.com',
    measurementId: 'G-9TTHNBTCKV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqSu5WwxRhPcdGEczjPxKXitGqozPldx8',
    appId: '1:400266413597:android:3e6c22b786b592f2b528f4',
    messagingSenderId: '400266413597',
    projectId: 'tharwat-chat-app',
    storageBucket: 'tharwat-chat-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjg8PQ-uimN7t0pjXZmyvskBuSqNmqlPo',
    appId: '1:400266413597:ios:4abaf196b8f9035ab528f4',
    messagingSenderId: '400266413597',
    projectId: 'tharwat-chat-app',
    storageBucket: 'tharwat-chat-app.appspot.com',
    iosClientId:
        '400266413597-kj2nu73q19uh3bj2me7m1cf1lp6mnlh5.apps.googleusercontent.com',
    iosBundleId: 'com.example.scholarChat',
  );
}