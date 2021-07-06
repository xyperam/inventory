import 'package:flutter/material.dart';
import 'package:inventory/pages/SubMenu/Other.dart';
import 'package:inventory/pages/SubMenu/Sembako.dart';

class HomePage extends StatelessWidget {

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

// Layout 1
            Row(
              children: <Widget>[
// Menu 1 Start
                Container(
                  margin: EdgeInsets.only(
                            top: 45.0,
                            bottom: 0.0,
                            left: 5.0,
                            right: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () => {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Sembako();
                            }))
                          },
                        ),
                        padding: EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 10.0,
                                  left: 10.0,
                                  right: 10.0),
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(30.0),
                            image: DecorationImage(
                              image: new AssetImage('assets/sembako.jpg'),
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            )),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Sembako",
                        style: TextStyle(fontFamily: 'Varela', fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
//Menu 1 End
// Menu 2 Start
                Container(
                  margin: EdgeInsets.only(
                            top: 45.0,
                            bottom: 0.0,
                            left: 5.0,
                            right: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () => {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Other();
                            }))
                          },
                        ),
                        padding: EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 10.0,
                                  left: 10.0,
                                  right: 10.0),
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(30.0),
                            image: DecorationImage(
                              image: new AssetImage('assets/snack1.webp'),
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            )),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Other",
                        style: TextStyle(fontFamily: 'Varela', fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
// Menu 2 End
              ],
            ),

// Layout 2
            // Row(
            //   children: <Widget>[
            //     Container(
            //       margin: EdgeInsets.only(
            //                 top: 45.0,
            //                 bottom: 0.0,
            //                 left: 5.0,
            //                 right: 5.0),
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10.0),
            //           boxShadow: [
            //             BoxShadow(
            //                 color: Colors.grey.withOpacity(0.2),
            //                 spreadRadius: 3.0,
            //                 blurRadius: 5.0)
            //           ],
            //           color: Colors.white),
            //       child: Column(
            //         children: [
            //           Container(
            //             margin: EdgeInsets.all(10.0),
            //             child: InkWell(
            //               onTap: () => {
            //                 Navigator.push(context,
            //                     MaterialPageRoute(builder: (context) {
            //                   // return Rendang();
            //                 }))
            //               },
            //             ),
            //             padding: EdgeInsets.only(
            //                       top: 10.0,
            //                       bottom: 10.0,
            //                       left: 10.0,
            //                       right: 10.0),
            //             height: 150.0,
            //             width: 150.0,
            //             decoration: BoxDecoration(
            //                 boxShadow: [
            //                   BoxShadow(
            //                     color: Colors.white,
            //                   ),
            //                 ],
            //                 borderRadius: BorderRadius.circular(30.0),
            //                 image: DecorationImage(
            //                   image: NetworkImage(
            //                       "https://asset.kompas.com/crops/a29yE_hzxM0nJBIId_Lh6aeDkok=/0x3:977x654/780x390/data/photo/2020/06/30/5efaf91e0ec2c.jpg"),
            //                   fit: BoxFit.fill,
            //                   alignment: Alignment.center,
            //                 )),
            //           ),
            //           SizedBox(
            //             height: 5.0,
            //           ),
            //           Text(
            //             "Sembako",
            //             style: TextStyle(fontFamily: 'Varela', fontSize: 15.0),
            //           ),
            //           SizedBox(
            //             height: 10.0,
            //           ),
            //         ],
            //       ),
            //     ),



            //     Container(
            //       margin: EdgeInsets.only(
            //                 top: 45.0,
            //                 bottom: 0.0,
            //                 left: 5.0,
            //                 right: 5.0),
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10.0),
            //           boxShadow: [
            //             BoxShadow(
            //                 color: Colors.grey.withOpacity(0.2),
            //                 spreadRadius: 3.0,
            //                 blurRadius: 5.0)
            //           ],
            //           color: Colors.white),
            //       child: Column(
            //         children: [
            //           Container(
            //             margin: EdgeInsets.all(10.0),
            //             child: InkWell(
            //               onTap: () => {
            //                 Navigator.push(context,
            //                     MaterialPageRoute(builder: (context) {
            //                   // return Rendang();
            //                 }))
            //               },
            //             ),
            //             padding: EdgeInsets.only(
            //                       top: 10.0,
            //                       bottom: 10.0,
            //                       left: 10.0,
            //                       right: 10.0),
            //             height: 150.0,
            //             width: 150.0,
            //             decoration: BoxDecoration(
            //                 boxShadow: [
            //                   BoxShadow(
            //                     color: Colors.white,
            //                   ),
            //                 ],
            //                 borderRadius: BorderRadius.circular(30.0),
            //                 image: DecorationImage(
            //                   image: NetworkImage(
            //                       "https://asset.kompas.com/crops/a29yE_hzxM0nJBIId_Lh6aeDkok=/0x3:977x654/780x390/data/photo/2020/06/30/5efaf91e0ec2c.jpg"),
            //                   fit: BoxFit.fill,
            //                   alignment: Alignment.center,
            //                 )),
            //           ),
            //           SizedBox(
            //             height: 5.0,
            //           ),
            //           Text(
            //             "Sembako",
            //             style: TextStyle(fontFamily: 'Varela', fontSize: 15.0),
            //           ),
            //           SizedBox(
            //             height: 10.0,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            
          ],
        )
      ],
    )));
  }
}