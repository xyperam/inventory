class Barang {
  int id;
  String namaBarang;
  int stock;

  Barang(this.id, this.namaBarang, this.stock);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'namaBarang': namaBarang,
      'stock': stock,
    };
    return map;
  }

  Barang.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    namaBarang = map['namaBarang'];
    stock = map['stock'];
  }
}
