import 'package:flutter/material.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

import 'Home.dart';
import 'SignIn.dart';

class Mulai extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Mulai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              child: Image(
                image: AssetImage("images/welcome.png"),
                fit: BoxFit.contain,
              ),
            ),
            RichText(
                text: TextSpan(
                    text: 'Welcome to',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                      text: ' Sensus Coy',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue))
                ])),
            SizedBox(height: 10.0),
            Text(
              'Aplikasi Sensus Penduduk Kota Batu',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20.0),
            SignInButton(
                buttonType: ButtonType.google,
                buttonSize: ButtonSize.medium,
                onPressed: () {
                  signInWithGoogle().then((result) {
                    if (result != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Home(result);
                          },
                        ),
                      );
                    }
                  });
                })
          ],
        ),
      ),
    );
  }
}