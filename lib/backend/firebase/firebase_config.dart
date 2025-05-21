import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCQIFvX-HuYrVhDiE9xvTkJ-QoEFmuwZi0",
            authDomain: "habit-loop-za8ihp.firebaseapp.com",
            projectId: "habit-loop-za8ihp",
            storageBucket: "habit-loop-za8ihp.firebasestorage.app",
            messagingSenderId: "288989797141",
            appId: "1:288989797141:web:93cfa8c24bb8c5b739a71c"));
  } else {
    await Firebase.initializeApp();
  }
}
