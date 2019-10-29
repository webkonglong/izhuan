import 'package:flutter/material.dart';
import '../../local_modules/px.dart';
import '../../local_modules/ajax.dart';

import '../../components/goods.dart';

class HomeTabPage extends StatefulWidget {
  String url;
  dynamic datas;
  HomeTabPage(this.url, this.datas);

  @override
  _HomeTabPage createState() => _HomeTabPage();
}

class _HomeTabPage extends State<HomeTabPage> with TickerProviderStateMixin <HomeTabPage>  {
  ScrollController _controller = new ScrollController();
  var datas = [];
  var page = 1;
  var isLoading = false;
  var end = false;

  @override
  void initState() {
    getData();
    _controller.addListener(() {
      if (!end && !isLoading && _controller.position.pixels == _controller.position.maxScrollExtent && mounted) {
        print("底部了");
        page = page + 1;
        getData();
        setState(() {
          isLoading = true;
        });
      }
    });

    super.initState();
  }

  getData () {
    ajax({
      'type': 'get',
      'url': 'https://api.zhetaoke.com:10003/api/${widget.url}.ashx',
      'data': {
        'appkey': 'f1c7c24c8e0c43a0860799a0448ff523',
        'page_size': 20,
        'page': page,
        'sort': 'new'
      },
      'datas': widget.datas,
      'success': (resp) {
        if (mounted) {
          if (!end && resp.length == 20) {
            datas.addAll(resp);
            setState(() {
              datas = datas;
              isLoading = false;
            });
          } else {
            datas.addAll(resp);
            setState(() {
              datas = datas;
              end = true;
              isLoading = false;
            });
          }
        }
      },
      'error': (err) {
        print(err);
      }
    });
  }

  Widget _goodsWidget () {
    return datas.length == 0 ? Container(
      padding: new EdgeInsets.fromLTRB(0.0, Px.px(20), 0.0, Px.px(20)),
      height: Px.px(80),
      child: Text("加载中～", style: TextStyle(
        fontSize: Px.px(28),
        color: Color(0xFFE88683),
      ),textAlign: TextAlign.center,),
    ) : Goods(datas, isLoading, end);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      controller: _controller,
      children: <Widget>[
        _goodsWidget()
      ],
    );
  }
}