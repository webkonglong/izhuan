import 'package:flutter/material.dart';
import 'dart:io';
import '../../local_modules/px.dart';

class Personal extends StatefulWidget {
  @override
  _PersonalPage createState() => _PersonalPage();
}

class _PersonalPage extends State<Personal> with TickerProviderStateMixin <Personal> {


  Widget commissionWidget () {
    return Container(
      width: Px.px(750),
      height: Px.px(160),
      padding: EdgeInsets.fromLTRB(Px.px(60), Px.px(30), Px.px(60), 0.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFE88683),
            Color(0xFFF3A6A4),
          ])
      ),
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

  Widget detailedWidget () {
    return Container(
      width: Px.px(750),
      height: Px.px(80),
      color: Color(0xFFFFFFFF),
      padding: EdgeInsets.fromLTRB(0.0, Px.px(10), 0.0, Px.px(10)),
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Container(
              height: Px.px(60),
              width: Px.px(375),
              alignment: Alignment.center,
              child: Text('收入明细', style: TextStyle(
                  fontSize: Px.px(24),
                  color: Color(0xFF666666)
              ),),
            ),
            onTap: () {
              print('收入明细');
            },
          ),
          Container(
            height: Px.px(40),
            width: Px.onepx(),
            color: Color(0xFF666666),
            child: Text(''),
          ),
          GestureDetector(
            child: Container(
              height: Px.px(60),
              width: Px.px(374),
              alignment: Alignment.center,
              child: Text('邀请记录', style: TextStyle(
                  fontSize: Px.px(24),
                  color: Color(0xFF666666)
              ),),
            ),
            onTap: () {
              print('邀请记录');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEDFDE),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text('个人中心', style: TextStyle(
          color: Color(0xFF333333)
        ),),
      ),
      body: ListView(
        children: <Widget>[
          commissionWidget(),
          detailedWidget()
        ],
      ),
    );
  }
}