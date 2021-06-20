class Warga {
  int _id;
  String _noKK;
  String _nik;
  String _nama;

  int get id => _id;
  String get noKK => this._noKK;
  set noKK(String value) => this._noKK = value;
  String get nik => this._nik;
  set nik(String value) => this._nik = value;
  String get nama => this._nama;
  set nama(String value) => this._nama = value;

  // konstruktor versi 1
  Warga(this._noKK, this._nik, this._nama);

  // konstruktor versi 2: konversi dari Map ke Item
  Warga.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._noKK = map['noKK'];
    this._nik = map['nik'];
    this._nama = map['nama'];
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