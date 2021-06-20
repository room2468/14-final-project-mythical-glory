import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sensus/Data_Warga/ItemWarga.dart';
import 'package:sensus/Data_Warga/entryWarga.dart';
import 'package:sensus/Database/database.dart';
import 'package:sensus/Database/dbHelper.dart';

class DataWarga extends StatefulWidget {
  static const Warga = '/wargaLama';
  final id;
  DataWarga(this.id);
  @override
  DataWargaState createState() => DataWargaState();
  }
  
  class DataWargaState extends State < DataWarga > {
    DbHelper dbHelper = DbHelper();
    int count = 0;
    List<Warga> wargaList;
    @override
    Widget build(BuildContext context) {
      String warga = widget.id;
      print (warga);
      if (wargaList == null) {
      wargaList = List<Warga>();
    }
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Data Warga',
            style: TextStyle(
              fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF545d78)),
          ),
        ),
      body: Column(
          children: [
            Expanded(
              child: firestoreList(warga),
            ),
          ]
        ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          var wrg = await navigateToEntryWarga (
          context, null, null, null ,warga, null);     

          if (wrg != null) {
              //TODO 2 Panggil Fungsi untuk Insert ke DB
                  int result = await dbHelper.insertWarga(wrg);
                  if (result > 0) {
                  }
                }
        },
        label: const Text('Tambah Data'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
        ),
    );
}

  Future < Warga > navigateToEntryWarga(BuildContext context, 
    String noKK, String nik, String nama, String id, String docId) async {
      var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
          return EntryFormWarga(noKK,nik, nama, id, docId);
        }));
      return result;
    }

  StreamBuilder firestoreList(String s) {
      TextStyle textStyle = Theme.of(context).textTheme.headline5;

      return StreamBuilder < QuerySnapshot > (
        stream: Database.readWarga(s),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              alignment: Alignment.center,
              child: Text('Loading',
                style: TextStyle(fontWeight: FontWeight.bold)));
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                var noteInfo = snapshot.data.docs[index].data();
                String docID = snapshot.data.docs[index].id;
                String noKK = noteInfo['noKK'];
                String nik = noteInfo['nik'];
                String nama = noteInfo['nama'];

          return Card(
                  color: Colors.white,
                  elevation: 2.0,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                    'https://www.clipartkey.com/mpngs/m/101-1016217_free-user-avatar-icons-happy-user-icon-png.png'),
                    ),
                    title: Text(
                      nama,
                      style: textStyle,
                    ),
                    subtitle: Text(noKK + "\n" + nik),
                    trailing: GestureDetector(
                      child: Icon(Icons.delete),
                      onTap: () async {
                        await Database.deleteWarga(uid: s, docId: docID);
                      },
                    ),
                    onTap: () async {
                      var wrg = await navigateToEntryWarga(context,noKK,nik, nama, 
                       s, docID);
                      int result = await dbHelper.updateWarga(wrg);
                      if (result > 0) {
                      }
                    },
                  ),
                );
                },
            );
          }
        },
      );
    }
  }


