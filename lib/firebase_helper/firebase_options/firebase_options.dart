import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      return const FirebaseOptions(
        appId: '1:177002162175:ios:28e044343e8712d2f269ca',
        apiKey: 'AIzaSyBeWIuBlk-YRcta_qSHRXopBn7RhlFW-cA',
        projectId: 'ecommerce-ee418',
        messagingSenderId: '177002162175',
        iosBundleId: 'com.example.app1',
      );
    } else {
      return const FirebaseOptions(
        //Android
        appId: '1:177002162175:android:ecb1365e376d75d7f269ca',
        apiKey: 'AIzaSyA8puv9G9yc4k4zM4fo8QiLVG8cFnDwB7g',
        projectId: 'ecommerce-ee418',
        messagingSenderId: '177002162175',
      );
    }
  }
}
