// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';


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

  static FirebaseOptions android = FirebaseOptions(
    apiKey: "${dotenv.env["APIKEYAND"]}",
    appId: '1:411110404175:android:dee335a3262803f7363a3a',
    messagingSenderId: '411110404175',
    projectId: 'medication-reminder-8332c',
    storageBucket: 'medication-reminder-8332c.appspot.com',
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: "${dotenv.env["APIKEYIOS"]}",
    appId: '1:411110404175:ios:a5ae361a86e64970363a3a',
    messagingSenderId: '411110404175',
    projectId: 'medication-reminder-8332c',
    storageBucket: 'medication-reminder-8332c.appspot.com',
    iosBundleId: 'com.example.medicationReminder',
  );

  static FirebaseOptions windows = FirebaseOptions(
    apiKey: "${dotenv.env["APIKEYWEB"]}",
    appId: '1:411110404175:web:ba4aad935644bfb6363a3a',
    messagingSenderId: '411110404175',
    projectId: 'medication-reminder-8332c',
    authDomain: 'medication-reminder-8332c.firebaseapp.com',
    storageBucket: 'medication-reminder-8332c.appspot.com',
    measurementId: 'G-56TYQLXWFP',
  );
}
