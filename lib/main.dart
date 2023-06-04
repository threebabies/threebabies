// import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'OrderFormPage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'FirebaseUtils.dart';
// api : AIzaSyCqtHedTAXDlNcwwe3o8i8WB--saGuXu0E
// web : 336744937807-4b594bhe1nc46s87hr8ajnm8upf6taqr.apps.googleusercontent.com
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseUtils().init();
  runApp(const MyApp());
}

// void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      // home: OrderFormPage(),
    );
  }
}