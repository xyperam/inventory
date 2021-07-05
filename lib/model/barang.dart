class Barang {
  int id;
  String namaBarang;
  int harga;

  Barang(this.id, this.namaBarang, this.harga);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'namaBarang': namaBarang,
      'harga': harga,
    };
    return map;
  }

  Barang.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    namaBarang = map['namaBarang'];
    harga = map['harga'];
  }
}
