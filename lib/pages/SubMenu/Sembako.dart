import 'package:flutter/material.dart';
import 'package:inventory/dbHelper/dbHelper.dart';
import 'package:inventory/model/barang.dart';

// class Sembako extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(

// body: ListView(
//       children: <Widget>[
//         Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [

//             Column(
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.only(
//                     top: 25.0,
//                     bottom: 0.0,
//                     left: 50.0,
//                     right: 50.0),
//                   child: Text("WARUNG.KU",
//                           style: TextStyle(fontFamily: 'Varela', fontSize: 15.0),
//                           ),
//                 ),
//               ],
//             ),

//             Column(
//               children: <Widget>[
//                 Container(
//                   // Form Here
//                   child: Text("Form Here",
//                     style: TextStyle(fontFamily: 'Varela', fontSize: 15.0),
//                   ),
//                 )
//               ],
//             ),

//           ],
//         )
//       ],
//     )));
//   }
// }

class Sembako extends StatefulWidget {
  @override
  _SembakoState createState() => _SembakoState();
}

class _SembakoState extends State<Sembako> {
  Future<List<Barang>> allBarang;
  TextEditingController controller = TextEditingController();
  int idBarang;
  String namaBarang;
  int stock;

  final formKey = new GlobalKey<FormState>();
  var dbHelper;
  bool isUpdating;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    isUpdating = false;
  }

  refreshList() {
    setState(() {
      allBarang = dbHelper.getAllBarang();
    });
  }

  clearNamaBarang() {
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
      clearNamaBarang();
      refreshList();
    }
  }

  form() {
    return Form(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Nama Barang'),
              validator: (val) =>
                  val.length == 0 ? 'Masukan Nama Barang' : null,
              onSaved: (val) => namaBarang = val,
            ),
            Spacer(),
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nama Barang'),
              validator: (val) =>
                  val.length == 0 ? 'Masukan jumlah barang' : null,
              onSaved: (val) => stock = val as int,
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
        title: new Text('Flutter SQLITE CRUD DEMO'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            form(),
            list(),
          ],
        ),
      ),
    );
  }
}
