import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './appbar.dart';

class Home extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<Home> with TickerProviderStateMixin <Home> {
  @override

  GlobalKey _keyFilter = GlobalKey();
  final controller = TextEditingController();


  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 242, 241, 1),
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Color.fromRGBO(234, 133, 129, 1),
          title: Container(
            child: Bar(),
          ),
        ),
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(170)),
      ),
      body: Text("home"),
    );
  }
}