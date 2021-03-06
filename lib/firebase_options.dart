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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
      // ignore: no_default_cases
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDgcQ6-QSUguHbCLLdOirTiK6UGQJKvlrw',
    appId: '1:646217320980:android:d489e2652d2eb9ce1ab501',
    messagingSenderId: '646217320980',
    projectId: 'medical-reminder-uoc',
    storageBucket: 'medical-reminder-uoc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA76milhe5BXr4dHff7d8F_iLSdar4nD3M',
    appId: '1:646217320980:ios:2c24b5babdaf9b061ab501',
    messagingSenderId: '646217320980',
    projectId: 'medical-reminder-uoc',
    storageBucket: 'medical-reminder-uoc.appspot.com',
    iosClientId:
        '646217320980-355ar5abg8jm59dv66k1ipdcrpu21dfh.apps.googleusercontent.com',
    iosBundleId: 'com.asignes.medicalreminder',
  );
}
