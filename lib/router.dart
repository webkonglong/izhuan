import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pages/home/home.dart';
import 'pages/brand.dart';
import 'pages/tool.dart';
import 'pages/rank.dart';
import 'pages/personal.dart';

class Router extends StatefulWidget {
  @override
  routerState createState () {
    return routerState();
  }
}

class routerState extends State<Router> {
  final List<Widget> list = List();
  int _currentIndex = 0;

  @override
  void initState () {
    list..add(Home())..add(Brand())..add(Rank())..add((Tool()))..add((Personal()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            title: Text('首页', style: TextStyle(color: Colors.blue),),
            icon: Icon(Icons.home,color: Colors.blue,),
          ),
          BottomNavigationBarItem(
            title: Text('品牌', style: TextStyle(color: Colors.blue),),
            icon: Icon(Icons.menu,color: Colors.blue,),
          ),
          BottomNavigationBarItem(
            title: Text('等级', style: TextStyle(color: Colors.blue),),
            icon: Icon(Icons.menu,color: Colors.blue,),
          ),
          BottomNavigationBarItem(
            title: Text('工具', style: TextStyle(color: Colors.blue),),
            icon: Icon(Icons.menu,color: Colors.blue,),
          ),
          BottomNavigationBarItem(
            title: Text('我的', style: TextStyle(color: Colors.blue),),
            icon: Icon(Icons.menu,color: Colors.blue,),
          ),
        ],
      ),
    );
  }
}