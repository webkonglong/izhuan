import 'package:flutter/material.dart';
import '../../local_modules/px.dart';

import './home_tab_page.dart';

class Nine extends StatefulWidget {
  @override
  _Nine createState() => _Nine();
}

class _Nine extends State<Nine> with TickerProviderStateMixin <Nine> {
  ScrollController _controller = new ScrollController();
  final List<Tab> _tabs = <Tab>[
    new Tab(text: '女装'),
    new Tab(text: '母婴'),
    new Tab(text: '美妆'),
    new Tab(text: '居家日用'),
    new Tab(text: '鞋品'),
    new Tab(text: '美食'),
    new Tab(text: '文娱车品'),
    new Tab(text: '数码家电'),
    new Tab(text: '男装'),
    new Tab(text: '内衣'),
    new Tab(text: '箱包'),
    new Tab(text: '配饰'),
    new Tab(text: '户外运动'),
    new Tab(text: '家装家纺'),
  ];
  var _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: _tabs.length);

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 242, 241, 1),
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Color.fromRGBO(234, 133, 129, 1),
          title: Text('9.9元商品'),
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
          HomeTabPage('api_all', {'price': '0.0-9.9', 'cid': 1}),
          HomeTabPage('api_all', {'price': '0.0-9.9', 'cid': 2}),
          HomeTabPage('api_all', {'price': '0.0-9.9', 'cid': 3}),
          HomeTabPage('api_all', {'price': '0.0-9.9', 'cid': 4}),
          HomeTabPage('api_all', {'price': '0.0-9.9', 'cid': 5}),
          HomeTabPage('api_all', {'price': '0.0-9.9', 'cid': 6}),
          HomeTabPage('api_all', {'price': '0.0-9.9', 'cid': 7}),
          HomeTabPage('api_all', {'price': '0.0-9.9', 'cid': 8}),
          HomeTabPage('api_all', {'price': '0.0-9.9', 'cid': 9}),
          HomeTabPage('api_all', {'price': '0.0-9.9', 'cid': 10}),
          HomeTabPage('api_all', {'price': '0.0-9.9', 'cid': 11}),
          HomeTabPage('api_all', {'price': '0.0-9.9', 'cid': 12}),
          HomeTabPage('api_all', {'price': '0.0-9.9', 'cid': 13}),
          HomeTabPage('api_all', {'price': '0.0-9.9', 'cid': 14}),
        ],
      ),
    );
  }
}