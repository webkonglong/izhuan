import 'package:flutter/material.dart';

class Tool extends StatefulWidget {
  @override
  _ToolPage createState() => _ToolPage();
}

class _ToolPage extends State<Tool> with TickerProviderStateMixin <Tool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('工具'),),
      body: Center(
        child: Text('工具'),
      ),
    );
  }
}