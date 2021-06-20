class Item {
  int _id;
  String _noKK;
  String _nik;
  String _nama;
  String _idUser;

  int get id => _id;
  String get noKK => this._noKK;
  set noKK(String value) => this._noKK = value;
  String get nik => this._nik;
  set nik(String value) => this._nik = value;
  String get nama => this._nama;
  set nama(String value) => this._nama = value;
  get idUser => this._idUser;
  set idUser(value) => this._idUser = value;
  
// konstruktor versi 1
  Item(this._noKK, this._nik, this._nama);
// konstruktor versi 2: konversi dari Map ke Item
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._noKK = map['noKK'];
    this._nik = map['nik'];
    this._nama= map['nama'];
  }
  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['noKK'] = noKK;
    map['nik'] = nik;
    map['nama'] = nama;
    return map;
  }
}