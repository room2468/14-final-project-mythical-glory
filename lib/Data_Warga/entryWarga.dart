import 'package:flutter/material.dart';
import 'package:sensus/Database/database.dart';


class EntryFormWarga extends StatefulWidget {
  final String noKK;
  final String nik;
  final String nama;
  final String id;
  final String docId;
  EntryFormWarga(this.noKK, this.nik, this.nama, this.id, this.docId);
  @override
  EntryFormWargaState createState() =>EntryFormWargaState(this.noKK, this.nik, this.nama, id, docId);
}

class EntryFormWargaState extends State<EntryFormWarga> {
  String noKK;
  String nik;
  String nama;
  String id;
  String docId;
  EntryFormWargaState(this.noKK, this.nik, this.nama, this.id, this.docId);
  TextEditingController noKKController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController namaController = TextEditingController();

  @override
  void dispose() {
    noKKController.dispose();
    nikController.dispose();
    namaController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    print (id);
//kondisi
    if (noKK != null) {
      noKKController.text = noKK;
      nikController.text = nik;
      namaController.text = nama;
    }
//rubah
    return Scaffold(
        appBar: AppBar(
          title: Text('Entry Form Data Kelahiran'),
          // Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
// nama
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: noKKController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Nomor Kartu Keluarga',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
// harga
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: nikController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Nomor Induk Keluarga',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),

// stok
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: namaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),

// tombol button
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
// tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                        onPressed: () {
                          if (noKK == null) {
                            Database.addWarga(
                                id: id,
                                noKK: noKKController.text,
                                nik: nikController.text,
                                nama: namaController.text);
                          } else {
                            Database.updateWarga(
                                uid: id,
                                noKK: noKKController.text,
                                nik: nikController.text,
                                nama: namaController.text,
                                docId: docId);
                          }
// kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
// tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}