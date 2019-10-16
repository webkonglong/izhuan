import 'package:flutter/material.dart';
import '../../local_modules/px.dart';
import '../../local_modules/ajax.dart';

import '../../components/goods.dart';

class BrandTabPage extends StatefulWidget {
  int tab;
  BrandTabPage(this.tab);

  @override
  _BrandTabPage createState() => _BrandTabPage();
}

class _BrandTabPage extends State<BrandTabPage> with TickerProviderStateMixin <BrandTabPage> {
  ScrollController _controller = new ScrollController();
  var datas = [];
  var page = 1;
  var isLoading = false;
  var end = false;

  @override
  void initState() {
    getBrandName();
    _controller.addListener(() {
      if (!end && !isLoading && _controller.position.pixels == _controller.position.maxScrollExtent) {
        print("底部了");
        page = page + 1;
        getBrandName();
        setState(() {
          isLoading = true;
        });
      }
    });

    super.initState();
  }

  getBrandName () {
    ajax({
      'type': 'get',
      'url': 'https://api.zhetaoke.com:10001/api/api_pinpai_name.ashx',
      'data': {
        'appkey': 'f1c7c24c8e0c43a0860799a0448ff523',
        'page_size': 20,
        'page': page,
        'cid': widget.tab
      },
      'success': (resp) {
        if (!end && resp.length == 20) {
          datas.addAll(resp);
          setState(() {
            datas = datas;
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
      }
    });
  }

  Widget _brandsWidget () {
    List<Widget> brandArrWidget = [];

    for (var item in datas) {
      brandArrWidget.add(GestureDetector(
        child: Container(
          constraints: new BoxConstraints.expand(
            height: Px.px(160),
            width: Px.px(710),
          ),
          padding: new EdgeInsets.fromLTRB(Px.px(30), Px.px(30), Px.px(30), Px.px(30)),
          margin: new EdgeInsets.fromLTRB(Px.px(20), Px.px(20), Px.px(20), 0.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
            color: Color(0xFFFFFFFF),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.network(
                    item['shopIcon'],
                    height: Px.px(100),
                    fit: BoxFit.contain,
                  ),
                  Container(
                    margin: new EdgeInsets.fromLTRB(Px.px(40), 0.0, 0.0, 0.0),
                    child: Text(item['pinpai_name'], style: TextStyle(
                        fontSize: Px.px(36),
                        color: Color(0xFF666666)
                    ),),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('查看', style: TextStyle(
                      fontSize: Px.px(36),
                      color: Color(0xFFC8984F)
                  )),
                  Container(
                    margin: new EdgeInsets.fromLTRB(Px.px(30), 0.0, 0.0, 0.0),
                    child: Image.asset(
                      "images/go.png",
                      width: Px.px(50),
                      height: Px.px(50),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          print(item['pinpai_name']);
        },
      ));
    }

    if (isLoading) {
      brandArrWidget.add(
          Container(
            padding: new EdgeInsets.fromLTRB(0.0, Px.px(20), 0.0, Px.px(20)),
            height: Px.px(80),
            child: Text("加载中～", style: TextStyle(
              fontSize: Px.px(28),
              color: Color(0xFFE88683),
            ),textAlign: TextAlign.center,),
          )
      );
    }

    if (end) {
      brandArrWidget.add(
          Container(
            padding: new EdgeInsets.fromLTRB(0.0, Px.px(20), 0.0, Px.px(20)),
            height: Px.px(80),
            child: Text("我是有底线的～", style: TextStyle(
              fontSize: Px.px(28),
              color: Color(0xFFE88683),
            ),textAlign: TextAlign.center,),
          )
      );
    }

    return Column(
      children: brandArrWidget,
    );
  }

  Widget _brandWidget () {
    return datas.length == 0 ? Container(
      padding: new EdgeInsets.fromLTRB(0.0, Px.px(20), 0.0, Px.px(20)),
      height: Px.px(80),
      child: Text("加载中～", style: TextStyle(
        fontSize: Px.px(28),
        color: Color(0xFFE88683),
      ),textAlign: TextAlign.center,),
    ) : _brandsWidget();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      controller: _controller,
      children: <Widget>[
        _brandWidget()
      ],
    );
  }
}