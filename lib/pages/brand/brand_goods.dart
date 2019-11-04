import 'package:flutter/material.dart';
import '../../local_modules/px.dart';
import '../../local_modules/ajax.dart';

import '../../components/goods.dart';

class BrandGoods extends StatefulWidget {
  String name;
  int cid;
  BrandGoods({this.name, this.cid});
  @override
  _BrandGoodsPage createState() => _BrandGoodsPage();
}

class _BrandGoodsPage extends State<BrandGoods> with TickerProviderStateMixin <BrandGoods> {
  ScrollController _controller = new ScrollController();
  var datas = [];
  var page = 1;
  var isLoading = true;
  var end = false;

  @override
  void initState() {
    getGoods();
    _controller.addListener(() {
      if (!end && !isLoading && _controller.position.pixels == _controller.position.maxScrollExtent) {
        print("底部了");
        page = page + 1;
        getGoods();
        setState(() {
          isLoading = true;
        });
      }
    });

    super.initState();
  }

  getGoods () {
    ajax({
      'type': 'get',
      'url': 'https://api.zhetaoke.com:10001/api/api_all.ashx',
      'data': {
        'appkey': 'f1c7c24c8e0c43a0860799a0448ff523',
        'page_size': 20,
        'page': page,
        'sort': 'new',
        'pinpai': 1,
        'cid': widget.cid,
        'pinpai_name': widget.name
      },
      'success': (resp) {

        if (!end && resp.length == 20) {
          datas.addAll(resp);
          setState(() {
            datas = datas;
            print(datas);
            isLoading = false;
          });
        } else {
          if (resp.length != 0) {
            datas.addAll(resp);
          }

          setState(() {
            datas = datas;
            end = true;
            isLoading = false;
          });
        }
      },
      'error': (err) {
        print(err);
        setState(() {
          end = true;
          isLoading = false;
        });
      }
    });
  }

  Widget _goodsWidget () {
    return isLoading ? Container(
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
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        title: Text('${widget.name}专区'),
        backgroundColor: Color(0xFFE88683),
      ),
      body: Scrollbar(
        child: Container(
          color: const Color(0xFFF1F1F1),
          // padding: new EdgeInsets.fromLTRB(Px.px(20), 0.0, Px.px(20), 0.0),
          child: ListView(
            shrinkWrap: true,
            controller: _controller,
            children: <Widget>[
              _goodsWidget()
            ],
          ),
        ),
      )
    );
  }
}