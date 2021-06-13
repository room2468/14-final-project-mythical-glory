// @dart=2.9
import 'package:flutter/material.dart';
import 'package:sensus/Home.dart';
import 'package:sensus/SplashScreenPage.dart';

import 'Mulai.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(),
    );
  }
}