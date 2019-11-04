import 'package:flutter/material.dart';
import '../../local_modules/px.dart';

import './brand_tab_page.dart';


class Brand extends StatefulWidget {
  @override
  _BrandPage createState() => _BrandPage();
}

class _BrandPage extends State<Brand> with TickerProviderStateMixin <Brand> {
  var _tabController;

  final List<Tab> _tabs = <Tab>[
    new Tab(text: '精选'),
    new Tab(text: '女装'),
    new Tab(text: '母婴'),
    new Tab(text: '美妆'),
    new Tab(text: '居家日用'),
    new Tab(text: '鞋品'),
    new Tab(text: '男装'),
    new Tab(text: '内衣'),
    new Tab(text: '箱包'),
    new Tab(text: '配饰'),
    new Tab(text: '美食'),
    new Tab(text: '文娱车品'),
    new Tab(text: '数码家电'),
    new Tab(text: '户外运动'),
    new Tab(text: '家装家纺'),
  ];

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: _tabs.length);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Color.fromRGBO(234, 133, 129, 1),
          title: Text('品牌专区'),
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
          BrandTabPage(0),
          BrandTabPage(1),
          BrandTabPage(2),
          BrandTabPage(3),
          BrandTabPage(4),
          BrandTabPage(5),
          BrandTabPage(9),
          BrandTabPage(10),
          BrandTabPage(11),
          BrandTabPage(12),
          BrandTabPage(6),
          BrandTabPage(7),
          BrandTabPage(8),
          BrandTabPage(13),
          BrandTabPage(14),
        ],
      ),
    );
  }
}