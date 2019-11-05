import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../../local_modules/px.dart';

import 'accpunt_status.dart';
import 'invitation.dart';
import 'income.dart';
import 'contact.dart';
import 'novice.dart';

class Personal extends StatefulWidget {
  @override
  _PersonalPage createState() => _PersonalPage();
}

class _PersonalPage extends State<Personal> with TickerProviderStateMixin <Personal> {
  Widget commissionWidget () {
    return Container(
      width: Px.px(750),
      height: Px.px(120),
      padding: EdgeInsets.fromLTRB(Px.px(60), Px.px(0), Px.px(60), 0.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('可体现金额', style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: Px.px(24)
              ),)
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, Px.px(10), 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '0.00',
                            style: TextStyle(
                                fontSize: Px.px(48),
                                color: Color(0xFFFFFFFF)
                            ),
                          ),
                          TextSpan(
                            text: ' 元',
                            style: TextStyle(
                                fontSize: Px.px(24),
                                color: Color(0xFFFFFFFF)
                            ),
                          ),
                        ]
                    )
                ),
                GestureDetector(
                  child: Container(
                    padding: new EdgeInsets.fromLTRB(Px.px(20), Px.px(6), Px.px(20), Px.px(6)),
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.all(new Radius.circular(Px.px(10))),
                      border: new Border.all(color: Color(0xFFFFFFFF), width: Px.onepx()),
                    ),
                    child: Text('提现', style: TextStyle(
                        color: Color(0xFFFFFFFF)
                    ),),
                  ),
                  onTap: () {
                    print('ti x');
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget userinfoWidget () {
    return Container(
      width: Px.px(750),
      height: Px.px(260),
      padding: EdgeInsets.fromLTRB(Px.px(60), Px.px(30), Px.px(60), 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Px.px(60)),
                image: DecorationImage(
                    image: NetworkImage("https://img.alicdn.com/imgextra/i4/890482188/O1CN010wE6Gs1S2985yuTT1_!!890482188.jpg_430x430q90.jpg"),
                    fit: BoxFit.cover
                )
            ),
            height: Px.px(120),
            width: Px.px(120),
            // margin: EdgeInsets.fromLTRB(0.0, 0.0, Px.px(50), 0.0),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, Px.px(20), 0.0, Px.px(10)),
            child: Text('安明哲16888', style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: Px.px(32)
            ),),
          ),
          GestureDetector(
            child: Text('邀请码 123435', style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: Px.px(24)
            ),),
            onTap: () {
              Toast.show('邀请码已复制', context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
            },
          )
        ],
      ),
    );
  }

  Widget rankWidget () {
    return GestureDetector(
      child: Container(
        height: Px.px(160),
        width: Px.px(750),
        color: Color(0xFFFFFFFF),
        margin: EdgeInsets.fromLTRB(0.0, Px.px(2), 0.0, 0.0),
        padding: EdgeInsets.fromLTRB(Px.px(40), Px.px(30), Px.px(20), Px.px(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('我的账户状态', style: TextStyle(
                        color: Color(0xFF404040),
                        fontSize: Px.px(32)
                    ),),
                    Container(
                      margin: EdgeInsets.fromLTRB(Px.px(20), 0.0, 0.0, 0.0),
                      child: Image.asset(
                        "images/level1.png",
                        // width: Px.px(36),
                        height: Px.px(40),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, Px.px(16), 0.0, 0.0),
                  child: Text('距离2级不远啦, 多多推广吧', style: TextStyle(
                      color: Color(0xFF999999)
                  ),),
                )
              ],
            ),
            Image.asset("images/icon_go.png", height: Px.px(40),)
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
          return AccpuntStatus();
        }));
      },
    );
  }

  Widget incomeWidget () {
    return Container(
      width: Px.px(750),
      margin: EdgeInsets.fromLTRB(0.0, Px.px(2), 0.0, 0.0),
      padding: EdgeInsets.all(Px.px(40)),
      color: Color(0xFFFFFFFF),
      child: Row(
        children: <Widget>[
          Container(
            width: Px.px(334),
            padding: EdgeInsets.fromLTRB(Px.px(40), 0.0, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("上月预估收入 (元)", style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: Px.px(24)
                ),),
                Container(
                  child: Text('981.12', style: TextStyle(
                      color: Color(0xFF404040),
                      fontSize: Px.px(32)
                  ),),
                )
              ],
            ),
          ),
          Container(
            width: Px.px(2),
            height: Px.px(60),
            color: Color(0xFFDEDFDE),
          ),
          Container(
            width: Px.px(334),
            padding: EdgeInsets.fromLTRB(Px.px(40), 0.0, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("本月预估收入 (元)", style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: Px.px(24)
                ),),
                Container(
                  child: Text('911.29', style: TextStyle(
                      color: Color(0xFF404040),
                      fontSize: Px.px(32)
                  ),),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  var menuList = [{
    'icon': 'images/personal_iInvitation.png',
    'name': '邀请记录',
    'index': 0
  }, {
    'icon': 'images/personal_income.png',
    'name': '收入明细',
    'index': 1
  }, {
    'icon': 'images/personal_novice.png',
    'name': '新手引导',
    'index': 2
  }, {
    'icon': 'images/personal_contact.png',
    'name': '联系我们',
    'index': 3
  }];



  Widget menuWidget () {
    List<Widget> menuArrWidget = [];
    for (var item in menuList) {
      menuArrWidget.add(GestureDetector(
        child: Container(
          width: Px.px(750),
          margin: EdgeInsets.fromLTRB(0.0, Px.px(2), 0.0, 0.0),
          padding: EdgeInsets.fromLTRB(Px.px(40), Px.px(30), Px.px(20), Px.px(30)),
          color: Color(0xFFFFFFFF),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    item['icon'],
                    width: Px.px(36),
                    height: Px.px(36),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(Px.px(10), 0.0, 0.0, 0.0),
                    child: Text(item['name'], style: TextStyle(
                        fontSize: Px.px(32),
                        color: Color(0xFF666666)
                    ),),
                  )
                ],
              ),
              Image.asset("images/icon_go.png", height: Px.px(40),)
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
            // return Invitation();
            // return Income();
            // return Contact();
            return Novice();
          }));
        },
      ));
    }

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: menuArrWidget
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text('个人中心', style: TextStyle(
          color: Color(0xFF404040)
        ),),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: Px.px(750),
            height: Px.px(400),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFFE88683),
                  Color(0xFFF3A6A4),
                ])
            ),
            child: Column(
              children: <Widget>[
                userinfoWidget(),
                commissionWidget(),
              ],
            ),
          ),
          incomeWidget(),
          rankWidget(),
          // detailedWidget(),
          menuWidget()
        ],
      ),
    );
  }
}