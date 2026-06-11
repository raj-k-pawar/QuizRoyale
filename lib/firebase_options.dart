// IMPORTANT: Replace this file with the output of:
//   flutterfire configure
// after connecting your Firebase project.
// See README.md → Firebase Setup for instructions.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'Quiz Royale does not support Web. Use Android.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'Quiz Royale targets Android only.',
        );
      default:
        throw UnsupportedError(
          'Unsupported platform: $defaultTargetPlatform',
        );
    }
  }

  /// TODO: Replace ALL values below with your real Firebase project config.
  /// Steps:
  ///   1. Go to console.firebase.google.com
  ///   2. Create a project named "quiz-royale" (or any name)
  ///   3. Add an Android app with package name: com.quizroyale.app
  ///   4. Download google-services.json → place in android/app/
  ///   5. Run: flutterfire configure
  ///   6. Replace this entire file with the generated firebase_options.dart
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3QLa5myhpznW5bMuL3wnTajk2SdBWFE0',
    appId: '1:481064272681:android:7c90d866f86dc178a42d38',
    messagingSenderId: '481064272681',
    projectId: 'quizroyale-25bce',
    storageBucket: 'quizroyale-25bce.firebasestorage.app',
    databaseURL: 'https://quizroyale-25bce-default-rtdb.firebaseio.com',
  );
}
