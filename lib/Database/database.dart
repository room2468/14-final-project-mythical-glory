import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class Database {
  static String userUid;
  static Future<void> addWarga({
    String id,
    String noKK,
    String nik,
    String nama,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(id).collection('warga').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "noKK": noKK,
      "nik": nik,
      "nama": nama,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Data Warga added to the database"))
        .catchError((e) => print(e));
  }

  // static Future<void> addWarga({
  //   String id,
  //   String menu,
  //   String bahan,
  //   String caraBuat,
  // }) async {
  //   DocumentReference documentReferencer =
  //       _mainCollection.doc(id).collection('western').doc();

  //   Map<String, dynamic> data = <String, dynamic>{
  //     "menu": menu,
  //     "bahan": bahan,
  //     "caraBuat": caraBuat,
  //   };

  //   await documentReferencer
  //       .set(data)
  //       .whenComplete(() => print("Data Warga added to the database"))
  //       .catchError((e) => print(e));
  // }

   static Future<void> updateWarga(
     {
    String uid,
    String noKK,
    String nik,
    String nama,
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(uid).collection('warga').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "noKK": noKK,
      "nik": nik,
      "nama": nama,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Data Warga updated in the database"))
        .catchError((e) => print(e));
  }

  // static Future<void> updateItemW(
  //    {
  //   String uid,
  //   String menu,
  //   String bahan,
  //   String caraBuat,
  //   String docId,
  // }) async {
  //   DocumentReference documentReferencer =
  //       _mainCollection.doc(uid).collection('western').doc(docId);

  //   Map<String, dynamic> data = <String, dynamic>{
  //     "menu": menu,
  //     "bahan": bahan,
  //     "caraBuat": caraBuat,
  //   };

  //   await documentReferencer
  //       .update(data)
  //       .whenComplete(() => print("Note item updated in the database"))
  //       .catchError((e) => print(e));
  // }

  static Stream<QuerySnapshot> readWarga(
    String uid
  ) {
    CollectionReference notesItemCollection =
        _mainCollection.doc(uid).collection('warga');

    return notesItemCollection.snapshots();
  }


// static Stream<QuerySnapshot> readItemsW(
//     String uid
//   ) {
//     CollectionReference notesItemCollection =
//         _mainCollection.doc(uid).collection('western');

//     return notesItemCollection.snapshots();
//   }

  static Future<void> deleteWarga({
    String uid,
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(uid).collection('warga').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Data Warga deleted from the database'))
        .catchError((e) => print(e));
  }

  // static Future<void> deleteItemW({
  //   String uid,
  //   String docId,
  // }) async {
  //   DocumentReference documentReferencer =
  //       _mainCollection.doc(uid).collection('western').doc(docId);

  //   await documentReferencer
  //       .delete()
  //       .whenComplete(() => print('Note item deleted from the database'))
  //       .catchError((e) => print(e));
  // }
}