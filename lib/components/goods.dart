import 'package:flutter/material.dart';

import '../local_modules/px.dart';

class Goods extends StatelessWidget {
  dynamic datas;
  dynamic isLoading;
  dynamic end;
  Goods(this.datas, this.isLoading, this.end);

  String formatPic (dynamic num) {

  }

  Widget goodListWidget (context) {
    List<Widget> goodArrWidget = [];

    for (var item in datas) {
        goodArrWidget.add(
            GestureDetector(
              child: new Container (
                constraints: new BoxConstraints.expand(
                  height: Px.px(240),
                  width: Px.px(710),
                ),
                padding: new EdgeInsets.fromLTRB(Px.px(20), Px.px(10), Px.px(10), Px.px(10)),
                margin: new EdgeInsets.fromLTRB(Px.px(20), Px.px(20), Px.px(20), 0.0),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(6.0)),
                  color: Color(0xFFFFFFFF),
                ),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        Image.network(
                          item['pict_url'],
                          width: Px.px(160),
                          height: Px.px(160),
                        ),
                        new Column(
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                Container(
                                  margin: new EdgeInsets.fromLTRB(Px.px(10), 0.0, Px.px(10), 0.0),
                                  padding: new EdgeInsets.fromLTRB(Px.px(10), Px.px(5), Px.px(10), Px.px(5)),
                                  decoration: new BoxDecoration(
                                    borderRadius: new BorderRadius.all(new Radius.circular(3.0)),
                                    color: Color(0xFFE88683),
                                  ),
                                  child: Text(
                                    item['user_type'] == 0 ? "淘" : "天",
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: Px.px(24),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
//                                  child: Image.asset(
//                                    item['user_type'] == 0 ? "images/tb.png" : "images/tm.png",
//                                    width: Px.px(40),
//                                    height: Px.px(40),
//                                  ),
                                ),
                                Container(
                                  width: Px.px(450),
                                  child: Text(
                                    item['title'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: Px.px(28),
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: Px.px(510),
                              margin: new EdgeInsets.fromLTRB(0.0, Px.px(14), 0.0, Px.px(14)),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(// 240
                                    // height: ScreenUtil().setHeight(50),
                                    child: new Row(
                                      children: <Widget>[
                                        Container(
                                          margin: new EdgeInsets.fromLTRB(Px.px(8), Px.px(10), 0.0, Px.px(10)),
                                          padding: new EdgeInsets.fromLTRB(Px.px(10), 0.0, Px.px(10), 0.0),
                                          decoration: new BoxDecoration(
                                            borderRadius: new BorderRadius.all(new Radius.circular(3.0)),
                                            color: Color(0xFFE88683),
                                          ),
                                          child: Text(
                                            "劵${item['coupon_info_money']}元",
                                            style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: Px.px(24),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "已售" + item['sellCount'] + "件",
                                    style: TextStyle(
                                      fontSize: Px.px(24),
                                      color: Color(0xFFA1A1A1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: Px.px(500),
                              margin: new EdgeInsets.fromLTRB(Px.px(8), 0.0, 0.0, 0.0),
                              child: new Row(
                                children: <Widget>[
                                  Text(
                                    '劵后 ￥ ',
                                    style: TextStyle(
                                      fontSize: Px.px(24),
                                      color: Color(0xFFA1A1A1),
                                    ),
                                  ),
                                  Text(
                                    item['quanhou_jiage'] + " ",
                                    style: TextStyle(
                                      fontSize: Px.px(32),
                                      color: Color(0xFF464646),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    " ￥ ",
                                    style: TextStyle(
                                      fontSize: Px.px(24),
                                      color: Color(0xFFA1A1A1),
                                    ),
                                  ),
                                  Text(
                                    item['size'],
                                    style: TextStyle(
                                      fontSize: Px.px(24),
                                      color: Color(0xFFA1A1A1),
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Color(0xFFA1A1A1),
                                      decorationStyle: TextDecorationStyle.solid,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      constraints: new BoxConstraints.expand(
                        height: Px.px(54),
                        width: Px.px(710),
                      ),
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: new EdgeInsets.fromLTRB(Px.px(20), Px.px(6), Px.px(20), Px.px(6)),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.all(new Radius.circular(6.0)),
                              color: Color(0xFFC51E13),
                            ),
                            child: Text("分享赚${item['tkfee3']}", style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: Px.px(28),
                            ),textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                print(item);
              },
            )
        );
    }

    if (isLoading) {
      goodArrWidget.add(
        Container(
          padding: new EdgeInsets.fromLTRB(0.0, Px.px(20), 0.0, Px.px(20)),
          height: Px.px(80),
          child: Text("加载中,清稍后", style: TextStyle(
            fontSize: Px.px(28),
            color: Color(0xFFE88683),
          ),textAlign: TextAlign.center,),
        )
      );
    }

    if (end) {
      goodArrWidget.add(
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
      children: goodArrWidget,
    );
  }


  @override
  Widget build(BuildContext context) {
    return goodListWidget(context);
  }
}