import 'package:flutter/material.dart';

class Personal extends StatefulWidget {
  @override
  _PersonalPage createState() => _PersonalPage();
}

class _PersonalPage extends State<Personal> with TickerProviderStateMixin <Personal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('个人'),),
      body: Center(
        child: Text('个人'),
      ),
    );
  }
}