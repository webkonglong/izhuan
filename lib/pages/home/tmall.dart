import 'package:flutter/material.dart';
import '../../local_modules/px.dart';

import './home_tab_page.dart';

class Tmall extends StatefulWidget {
  @override
  _Tmall createState() => _Tmall();
}

class _Tmall extends State<Tmall> with TickerProviderStateMixin <Tmall> {
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
          title: Text('天猫'),
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
          HomeTabPage('api_all', {'tj': 'tmall', 'cid': 1}),
          HomeTabPage('api_all', {'tj': 'tmall', 'cid': 2}),
          HomeTabPage('api_all', {'tj': 'tmall', 'cid': 3}),
          HomeTabPage('api_all', {'tj': 'tmall', 'cid': 4}),
          HomeTabPage('api_all', {'tj': 'tmall', 'cid': 5}),
          HomeTabPage('api_all', {'tj': 'tmall', 'cid': 6}),
          HomeTabPage('api_all', {'tj': 'tmall', 'cid': 7}),
          HomeTabPage('api_all', {'tj': 'tmall', 'cid': 8}),
          HomeTabPage('api_all', {'tj': 'tmall', 'cid': 9}),
          HomeTabPage('api_all', {'tj': 'tmall', 'cid': 10}),
          HomeTabPage('api_all', {'tj': 'tmall', 'cid': 11}),
          HomeTabPage('api_all', {'tj': 'tmall', 'cid': 12}),
          HomeTabPage('api_all', {'tj': 'tmall', 'cid': 13}),
          HomeTabPage('api_all', {'tj': 'tmall', 'cid': 14}),
        ],
      ),
    );
  }
}