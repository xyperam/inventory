import 'dart:html';

import 'package:flutter/material.dart';
import 'package:inventory/dbHelper/dbHelper.dart';
import 'package:inventory/model/barang.dart';
import 'dart:async';

class Sembako extends StatefulWidget {
  final String title;

  Sembako({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SembakoState();
  }
}

class _SembakoState extends State<Sembako> {
  //
  Future<List<Barang>> allBarang;
  TextEditingController controller = TextEditingController();
  String namaBarang;
  int idBarang;
  int stock;

  final formKey = new GlobalKey<FormState>();
  var dbHelper;
  bool isUpdating;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    isUpdating = false;
    refreshList();
  }

  refreshList() {
    setState(() {
      allBarang = dbHelper.getAllBarang();
    });
  }

  clearName() {
    controller.text = '';
  }

  validate() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      if (isUpdating) {
        Barang e = Barang(idBarang, namaBarang, stock);
        dbHelper.update(e);
        setState(() {
          isUpdating = false;
        });
      } else {
        Barang e = Barang(null, namaBarang, stock);
        dbHelper.save(e);
      }
      clearName();
      refreshList();
    }
  }

  form() {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (val) => val.length == 0 ? 'Enter Name' : null,
              onSaved: (val) => namaBarang = val,
            ),
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Stock'),
              validator: (i) => i.length == 0 ? 'Enter Stock' : null,
              onSaved: (i) => stock = i as int,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: validate,
                  child: Text(isUpdating ? 'UPDATE' : 'ADD'),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      isUpdating = false;
                    });
                    clearName();
                  },
                  child: Text('CANCEL'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView dataTable(List<Barang> allBarang) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text('NAME'),
          ),
          DataColumn(
            label: Text('DELETE'),
          )
        ],
        rows: allBarang
            .map(
              (barang) => DataRow(cells: [
                DataCell(
                  Text(barang.namaBarang),
                  onTap: () {
                    setState(() {
                      isUpdating = true;
                      idBarang = barang.id;
                    });
                    controller.text = barang.namaBarang;
                  },
                ),
                // DataCell(
                //   Text(barang.stock),
                //   onTap: () {
                //     setState(() {
                //       isUpdating = true;
                //       idBarang = barang.id;
                //     });
                //   },
                // ),
                DataCell(IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    dbHelper.delete(barang.id);
                    refreshList();
                  },
                )),
              ]),
            )
            .toList(),
      ),
    );
  }

  list() {
    return Expanded(
      child: FutureBuilder(
        future: allBarang,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataTable(snapshot.data);
          }

          if (null == snapshot.data || snapshot.data.length == 0) {
            return Text("No Data Found");
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sembako'),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            form(),
            list(),
          ],
        ),
      ),
    );
  }
}
