import 'package:flutter/material.dart';

class AccpuntStatus extends StatefulWidget {
  @override
  _AccpuntStatus createState() => _AccpuntStatus();
}

class _AccpuntStatus extends State<AccpuntStatus> with TickerProviderStateMixin <AccpuntStatus> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEDFDE),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text('个人中心', style: TextStyle(
            color: Color(0xFF404040)
        ),),
      ),
      body: ListView(
        children: <Widget>[
          Text('123')
        ],
      )
    );
  }
}