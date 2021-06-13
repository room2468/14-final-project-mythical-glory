import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sensus/SignIn.dart';

import 'Mulai.dart';

class DrawerNav extends StatefulWidget {
  @override
  _DrawerNavState createState() => _DrawerNavState();
}

class _DrawerNavState extends State<DrawerNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Gemoy"),
              accountEmail: Text("gmy@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://data.whicdn.com/images/327744867/original.jpg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sign Out"),
              onTap: (){
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return Mulai();
                  }), ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
    );
  }
}