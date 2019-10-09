import 'package:flutter/material.dart';

class Brand extends StatefulWidget {
  @override
  _BrandPage createState() => _BrandPage();
}

class _BrandPage extends State<Brand> with TickerProviderStateMixin <Brand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('品牌'),),
      body: Center(
        child: Text('品牌'),
      ),
    );
  }
}