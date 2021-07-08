import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../model/barang.dart';

class DBHelper {
  static Database _db;
  static const String id = 'id';
  static const String namaBarang = 'namaBarang';
  static const String stock = 'stock';
  static const String table = 'barang';
  static const String DB_NAME = 'inventory';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $table($id INTEGER PRIMARY KEY,$namaBarang TEXT,$stock INTEGER)");
  }

  Future<Barang> save(Barang barang) async {
    var dbClient = await db;
    barang.id = await dbClient.insert(table, barang.toMap());
    return barang;
  }

  Future<List<Barang>> getAllBarang() async {
    var dbClient = await db;
    List<Map> maps =
        await dbClient.query(table, columns: [id, namaBarang, stock]);
    List<Barang> allBarang = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        allBarang.add(Barang.fromMap(maps[i]));
      }
    }
    return allBarang;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(table, where: '$id = ?', whereArgs: [id]);
  }

  Future<int> update(Barang barang) async {
    var dbClient = await db;
    return await dbClient.update(table, barang.toMap(),
        where: '$id = ?', whereArgs: [barang.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
