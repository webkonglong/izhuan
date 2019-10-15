import 'package:flutter/material.dart';
import 'package:imei_plugin/imei_plugin.dart';

import '../../local_modules/px.dart';
import './appbar.dart';
import './home_page.dart';

class Home extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<Home> with TickerProviderStateMixin <Home> {
  @override

  final List<Tab> _tabs = <Tab>[
    new Tab(text: '首页'),
    new Tab(text: '母婴'),
    new Tab(text: '内衣'),
    new Tab(text: '男装'),
    new Tab(text: '手机'),
    new Tab(text: '女装'),
    new Tab(text: '食品'),
    new Tab(text: '生鲜'),
    new Tab(text: '家装'),
    new Tab(text: '电器'),
    new Tab(text: '鞋靴'),
    new Tab(text: '洗护'),
    new Tab(text: '百货'),
    new Tab(text: '箱包'),
    new Tab(text: '饰品'),
    new Tab(text: '美妆'),
    new Tab(text: '运动'),
    new Tab(text: '保健'),
    new Tab(text: '数码'),
    new Tab(text: '企业'),
    new Tab(text: '车品'),
  ];

  var _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: _tabs.length);

    ImeiPlugin.getImei().then((resp) => {
      print(resp)
    });
//    print(imei);
    super.initState();
  }



  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 242, 241, 1),
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Color.fromRGBO(234, 133, 129, 1),
          title: Bar(),
          bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            indicatorColor: Color(0xFFFFFFFF),
            labelStyle: TextStyle(fontSize: Px.px(28)),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.fromLTRB(0.0, Px.px(10), 0.0, Px.px(10)),
            tabs: _tabs,
          ),
        ),
        preferredSize: Size.fromHeight(Px.px(168)),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          HomePage(),
          Text('2'),
          Text('3'),
          Text('4'),
          Text('5'),
          Text('6'),
          Text('7'),
          Text('8'),
          Text('9'),
          Text('10'),
          Text('11'),
          Text('12'),
          Text('13'),
          Text('14'),
          Text('15'),
          Text('16'),
          Text('17'),
          Text('18'),
          Text('19'),
          Text('20'),
          Text('21'),
        ],
      ),
    );
  }
}