import 'package:flutter/material.dart';

class Sembako extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

body: ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    top: 25.0,
                    bottom: 0.0,
                    left: 50.0,
                    right: 50.0),
                  child: Text("WARUNG.KU",
                          style: TextStyle(fontFamily: 'Varela', fontSize: 15.0),
                          ),
                ),
              ],
            ),

            Column(
              children: <Widget>[
                Container(
                  // Form Here
                  child: Text("Form Here",
                    style: TextStyle(fontFamily: 'Varela', fontSize: 15.0),
                  ),
                )
              ],
            ),

          ],
        )
      ],
    )));
  }
}