import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sensus/Data_Kelahiran/DataKelahiran.dart';
import 'package:sensus/DrawerNav.dart';

import 'Data_Warga/DataWarga.dart';

class Home extends StatefulWidget {
  @override
  static String tag = 'home';
  final id;
  Home(this.id);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _current = 0;

    List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
}
  @override
  Widget build(BuildContext context) {
    User us = widget.id;
    String a;
    final User userArgs = ModalRoute.of(context).settings.arguments;
    if (userArgs != null) {
      a = userArgs.uid;
    }
    else {
      a = us.uid;
    }
    print(a);

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
      body: ListView(
        children: < Widget > [
          SizedBox(
            height: 250.0,
            width: double.infinity,
            child: Carousel(
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotColor: Colors.lightGreenAccent,
              indicatorBgPadding: 5.0,
              dotBgColor: Colors.transparent,
              dotVerticalPadding: 5.0,
              dotPosition: DotPosition.bottomCenter,
              onImageTap: (index) {
                    setState(() {
                    _current = index;
                  });
                  },
              images: [
                Image.asset(
                  'images/1.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/2.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/3.jpeg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Padding(
                padding: EdgeInsets.all(18.0),
                child: Text("Selamat Datang!\ndi Aplikasi Sensus Penduduk",
                  style:
                  TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: Wrap(
                children: < Widget > [
                  SizedBox(
                    width: 540.0,
                    height: 140.0,
                    child: Card(
                      color: Colors.white,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0)
                      ),
                      child: InkWell(
                        splashColor: Colors.orange[50] .withAlpha(30),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DataWarga(a),
                          ));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: < Widget > [
                              Image.asset('images/warga.png', width: 100.0,),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Data Warga ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: Wrap(
                children: < Widget > [
                  SizedBox(
                    width: 540.0,
                    height: 140.0,
                    child: Card(
                      color: Colors.white,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0)
                      ),
                      child: InkWell(
                        splashColor: Colors.orange[50] .withAlpha(30),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DataKelahiran()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: < Widget > [
                              Image.asset('images/baby.png', width: 100.0, ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Data Kelahiran",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}