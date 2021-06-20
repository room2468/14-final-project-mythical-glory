import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataWarga extends StatefulWidget {
  @override
  _DataWargaState createState() => _DataWargaState();
}

class _DataWargaState extends State<DataWarga> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Data Warga'
        ),
      ),
    );
  }
}