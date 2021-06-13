import 'package:flutter/material.dart';
import 'package:sensus/DrawerNav.dart';
import 'package:sensus/Mulai.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Sensus Penduduk'
        ),
      ),
      drawer: DrawerNav(),
    );
  }
}