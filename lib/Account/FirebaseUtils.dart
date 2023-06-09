// import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseUtils {
  static final FirebaseUtils _instance = FirebaseUtils._internal();


  factory FirebaseUtils() {
    return _instance;
  }

  FirebaseUtils._internal();

  FirebaseApp? app;
  Future<void> init() async {
    app = await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBy0wDQSBG-C8xl2RISVoukaOyJ0weTY6A",
            authDomain: "threebabies-d5e2e.firebaseapp.com",
            projectId: "threebabies-d5e2e",
            storageBucket: "threebabies-d5e2e.appspot.com",
            messagingSenderId: "42474083733",
            appId: "1:42474083733:web:833e3fe40e5b014962d29c",
            measurementId: "G-TQ1K4X4QRN"));
  }
  //
  //
}
