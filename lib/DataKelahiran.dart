import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataKelahiran extends StatefulWidget {

  @override
  _DataKelahiranState createState() => _DataKelahiranState();
}

class _DataKelahiranState extends State<DataKelahiran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Data Kelahiran'
        ),
      ),
    );
  }
}