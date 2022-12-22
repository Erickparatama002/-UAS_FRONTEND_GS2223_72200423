import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_frontend_72200423/mahasiswa/mahasiswa_get.dart';
import 'package:uas_frontend_72200423/splashscreen.dart';
import 'package:uas_frontend_72200423/Home.dart';
import 'Pertemuan_9.dart';

void main() {
  runApp(new MaterialApp(
    home: Splashscreen(title: "",),
  ));
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return new SplashScreen(
//       seconds: 14,
//       navigateAfterSeconds: new Pertemuan_9(title: 'Flutter Demo Home Page Pertemuan 9'),
//       title: new Text(
//         'Welcome In SplashScreen',
//         style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//       ),
//       image: Image.asset('images/logo.png'),
//       backgroundColor: Colors.white,
//       loaderColor: Colors.red,
//     );
//   }
// }