import 'package:flutter/material.dart';
import './local_modules/px.dart';

import 'pages/home/home.dart';
import 'pages/brand/brand.dart';
import 'pages/tool/tool.dart';
import 'pages/rank/rank.dart';
import 'pages/personal/personal.dart';

import './pages/brand/brand_goods.dart';
import './components/good_info.dart';
import './pages/home/large_volume.dart';
import './pages/home/quick.dart';
import './pages/home/supermarket.dart';
import './pages/home/nine.dart';
import './pages/home/tmall.dart';
import './pages/personal/accpunt_status.dart';
import './pages/personal/invitation.dart';

class HomeRouter extends StatefulWidget {
  @override
  routerState createState () {
    return routerState();
  }
}

class routerState extends State<HomeRouter> {
  final List<Widget> list = List();
  int _currentIndex = 0;

  @override
  void initState () {
    list..add(Home())..add(Brand())..add(Rank())..add((Tool()))..add((Personal()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            title: _currentIndex != 0 ? Text('首页', style: TextStyle(color: Color(0xFF000000)),) : Container(),
            icon: Image.asset(
              _currentIndex != 0 ? "images/home.png" : "images/home_active.png",
              height: Px.px(_currentIndex != 0 ? 40 : 70),
            ),
          ),
          BottomNavigationBarItem(
            title: _currentIndex != 1 ? Text('品牌', style: TextStyle(color: Color(0xFF000000)),) : Container(),
            icon: Image.asset(
              _currentIndex != 1 ? "images/brand.png" : "images/brand_active.png",
              height: Px.px(_currentIndex != 1 ? 50 : 70),
            ),
          ),
          BottomNavigationBarItem(
            title: _currentIndex != 2 ? Text('排行榜', style: TextStyle(color: Color(0xFF000000)),) : Container(),
            icon: Image.asset(
              _currentIndex != 2 ? "images/rank.png" : "images/rank_active.png",
              height: Px.px(_currentIndex != 2 ? 50 : 70),
            ),
          ),
          BottomNavigationBarItem(
            title: _currentIndex != 3 ? Text('工具', style: TextStyle(color: Color(0xFF000000)),) : Container(),
            icon: Image.asset(
              _currentIndex != 3 ? "images/tool.png" : "images/tool_active.png",
              height: Px.px(_currentIndex != 3 ? 40 : 70),
            ),
          ),
          BottomNavigationBarItem(
            title: _currentIndex != 4 ? Text('我的', style: TextStyle(color: Color(0xFF000000)),) : Container(),
            icon: Image.asset(
              _currentIndex != 4 ? "images/personal.png" : "images/personal_active.png",
              height: Px.px(_currentIndex != 4 ? 40 : 70),
            ),
          ),
        ],
      ),
    );
  }
}


class Router extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '爱赚',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) => HomeRouter(),
        '/brand': (BuildContext context) => BrandGoods(),
        '/goodinfo': (BuildContext context) => GoodInfo(),
        '/largevolume': (BuildContext context) => LargeVolume(),
        '/quick': (BuildContext context) => Quick(),
        '/supermarket': (BuildContext context) => Supermarket(),
        '/nine': (BuildContext context) => Nine(),
        '/tmall': (BuildContext context) => Tmall(),
        '/accpuntstatus': (BuildContext context) => AccpuntStatus(),
        '/invitation': (BuildContext context) => Invitation(),
      },
    );
  }
}

final ThemeData mDefaultTheme = new ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.white,
);