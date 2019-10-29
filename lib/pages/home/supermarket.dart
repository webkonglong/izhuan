import 'package:flutter/material.dart';
import '../../local_modules/px.dart';

import './home_tab_page.dart';

class Supermarket extends StatefulWidget {
  @override
  _Supermarket createState() => _Supermarket();
}

class _Supermarket extends State<Supermarket> with TickerProviderStateMixin <Supermarket> {
  ScrollController _controller = new ScrollController();
  final List<Tab> _tabs = <Tab>[
    new Tab(text: '全部商品'),
    new Tab(text: '母婴'),
    new Tab(text: '美妆'),
    new Tab(text: '居家日用'),
    new Tab(text: '美食'),
    new Tab(text: '数码家电'),
    new Tab(text: '内衣'),
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
          title: Text('天猫超市'),
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
          HomeTabPage('api_all', {'tianmaochaoshi': 1, 'cid': ''}),
          HomeTabPage('api_all', {'tianmaochaoshi': 1, 'cid': 2}),
          HomeTabPage('api_all', {'tianmaochaoshi': 1, 'cid': 3}),
          HomeTabPage('api_all', {'tianmaochaoshi': 1, 'cid': 4}),
          HomeTabPage('api_all', {'tianmaochaoshi': 1, 'cid': 6}),
          HomeTabPage('api_all', {'tianmaochaoshi': 1, 'cid': 8}),
          HomeTabPage('api_all', {'tianmaochaoshi': 1, 'cid': 10}),
          HomeTabPage('api_all', {'tianmaochaoshi': 1, 'cid': 14}),
        ],
      ),
    );
  }
}