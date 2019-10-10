import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '爱赚',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Router(),
    );
  }
}

final ThemeData mDefaultTheme = new ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.white,
);