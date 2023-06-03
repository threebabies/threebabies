// import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'OrderFormPage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   FirebaseApp app = await Firebase.initializeApp();
//   runApp(const MyApp());
// }

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: LoginPage(),
      home: OrderFormPage(),
    );
  }
}