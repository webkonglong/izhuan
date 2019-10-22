import 'package:flutter/material.dart';

class Rank extends StatefulWidget {
  @override
  _RankPage createState() => _RankPage();
}

class _RankPage extends State<Rank> with TickerProviderStateMixin <Rank> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEDFDE),
      body: Center(
        child: Text('11'),
      ),
    );
  }
}