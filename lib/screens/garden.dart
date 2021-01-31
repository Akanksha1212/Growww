import 'package:flutter/material.dart';

class Garden extends StatefulWidget {
  @override
  _GardenState createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff60316E),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 35, 20, 10),
        color: Color(0xffACF28B),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Text('hi'),
      ),
    );
  }
}
