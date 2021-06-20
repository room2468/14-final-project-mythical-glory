import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sensus/Data_Warga/ItemWarga.dart';
import 'package:sensus/models/UserSql.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'sensus.db';

    //create, read databases
    //create, read databases
    var database = openDatabase(path,
        version: 7, onCreate: _createDb, onUpgrade: _onUpgrade);
//mengembalikan nilai object sebagai hasil dari fungsinya
    return database;
  }

// update table baru
  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    _createDb(db, newVersion);
  }

  //buat tabel baru dengan nama item
  void _createDb(Database db, int version) async {
    var batch = db.batch();
    batch.execute('DROP TABLE IF EXISTS warga');
    batch.execute('DROP TABLE IF EXISTS user');
    batch.execute('''
    CREATE TABLE warga (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    noKK TEXT,
    nik TEXT,
    nama TEXT,
    idUser TEXT
    )
    ''');
    batch.execute('''
    CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT,
    password TEXT,
    name TEXT
    )
    ''');
    await batch.commit();
  }

//select databases item
  Future<List<Map<String, dynamic>>> select(String idUser) async {
    Database db = await this.initDb();
    var mapList = await db.query('item',where: 'idUser = "$idUser" ',orderBy: 'name');
    return mapList;
  }
  //select databases User
  Future<List<Map<String, dynamic>>> selectUser(int id) async {
    Database db = await this.initDb();
    var mapList = await db.query('user',limit: 3, where: 'id = $id');
    return mapList;
  }

//create databases
  Future<int> insertWarga(Warga object) async {
    Database db = await this.initDb();
    int count = await db.insert('item', object.toMap());
    return count;
  }

  // Future<int> insertW(Warga object) async {
  //   Database db = await this.initDb();
  //   int count = await db.insert('warga', object.toMap());
  //   return count;
  // }

//create databases user
  Future<int> insertUser(UserSql user) async {
    Database db = await this.initDb();
    int count = await db.insert('user', user.toMapUser());
    return count;
  }

//update databases
  Future<int> updateWarga(Warga object) async {
    Database db = await this.initDb();
    int count = await db
        .update('item', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  // Future<int> updateW(Warga object) async {
  //   Database db = await this.initDb();
  //   int count = await db
  //       .update('warga', object.toMap(), where: 'id=?', whereArgs: [object.id]);
  //   return count;
  // }

  //update databases user
  Future<int> updateUser(UserSql user) async {
    Database db = await this.initDb();
    int count = await db
        .update('user', user.toMapUser(), where: 'id=?', whereArgs: [user.id]);
    return count;
  }

  //delete databases
  Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('item', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Warga>> getItemList(String iduser) async {
    var itemMapList = await select(iduser);
    int count = itemMapList.length;
    List<Warga> itemList = List<Warga>();
    for (int i = 0; i < count; i++) {
      itemList.add(Warga.fromMap(itemMapList[i]));
    }
    return itemList;
  }

  // Future<List<ItemWest>> getItemListW(String iduser) async {
  //   var itemMapList = await select(iduser);
  //   int count = itemMapList.length;
  //   List<ItemWest> itemList = List<ItemWest>();
  //   for (int i = 0; i < count; i++) {
  //     itemList.add(ItemWest.fromMap(itemMapList[i]));
  //   }
  //   return itemList;
  // }

  Future<List<UserSql>> getUserList(int id) async {
    var itemMapList = await selectUser(id);
    int count = itemMapList.length;
    List<UserSql> itemList = List<UserSql>();
    for (int i = 0; i < count; i++) {
      itemList.add(UserSql.fromMapUser(itemMapList[i]));
    }
    return itemList;
  }

  Future<UserSql> getLogin(String user, String password) async {
    var dbClient = await this.initDb();
    var res = await dbClient.rawQuery(
        "SELECT * FROM user WHERE username = '$user' and password = '$password'");

    if (res.length > 0) {
      return new UserSql.fromMapUser(res.first);
    }
    return null;
  }

  Future<List<UserSql>> getAllUser() async {
    var dbClient = await this.initDb();
    var res = await dbClient.query("user");

    List<UserSql> list =
        res.isNotEmpty ? res.map((c) => UserSql.fromMapUser(c)).toList() : null;
    return list;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}