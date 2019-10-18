import 'package:flutter/material.dart';


import 'router.dart';
import './pages/brand/brand_goods.dart';
import './components/good_info.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '爱赚',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) => Router(),
        '/brand': (BuildContext context) => BrandGoods(),
        '/goodinfo': (BuildContext context) => GoodInfo(),
      },
    );
  }
}

final ThemeData mDefaultTheme = new ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.white,
);