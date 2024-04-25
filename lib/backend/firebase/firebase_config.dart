import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyADs6sGINj04ZbqqKukWA3nq0s26FYOvN0",
            authDomain: "poor-boy-full-ddaeax.firebaseapp.com",
            projectId: "poor-boy-full-ddaeax",
            storageBucket: "poor-boy-full-ddaeax.appspot.com",
            messagingSenderId: "101524147488",
            appId: "1:101524147488:web:8127b6dc9ee4bcb9971b45"));
  } else {
    await Firebase.initializeApp();
  }
}
