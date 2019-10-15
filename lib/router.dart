import 'package:flutter/material.dart';
import './local_modules/px.dart';

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
        backgroundColor: Color(0xFFC8D9DB),
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            title: Container(),
            icon: Image.asset(
              _currentIndex != 0 ? "images/home.png" : "images/home_active.png",
              width: Px.px(_currentIndex != 0 ? 60 : 70),
              height: Px.px(_currentIndex != 0 ? 60 : 70),
            ),
          ),
          BottomNavigationBarItem(
            title: Container(),
            icon: Image.asset(
              _currentIndex != 1 ? "images/brand.png" : "images/brand_active.png",
              width: Px.px(70),
              height: Px.px(70),
            ),
          ),
          BottomNavigationBarItem(
            title: Container(),
            icon: Image.asset(
              _currentIndex != 2 ? "images/rank.png" : "images/rank_active.png",
//              width: Px.px(_currentIndex != 2 ? 60 : 70),
//              height: Px.px(_currentIndex != 2 ? 60 : 70),
              width: Px.px(70),
              height: Px.px(70),
            ),
          ),
          BottomNavigationBarItem(
            title: Container(),
            icon: Image.asset(
              _currentIndex != 3 ? "images/tool.png" : "images/tool_active.png",
              width: Px.px(_currentIndex != 3 ? 60 : 70),
              height: Px.px(_currentIndex != 3 ? 60 : 70),
            ),
          ),
          BottomNavigationBarItem(
            title: Container(),
            icon: Image.asset(
              _currentIndex != 4 ? "images/personal.png" : "images/personal_active.png",
              width: Px.px(_currentIndex != 4 ? 60 : 70),
              height: Px.px(_currentIndex != 4 ? 60 : 70),
            ),
          ),
        ],
      ),
    );
  }
}