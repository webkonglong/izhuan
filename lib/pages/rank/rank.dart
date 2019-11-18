import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../../local_modules/px.dart';

class Rank extends StatefulWidget {
  @override
  _RankPage createState() => _RankPage();
}

class _RankPage extends State<Rank> with TickerProviderStateMixin <Rank> {
  ScrollController _controller = new ScrollController();
  var rankList = [{
    'account': '185****2828',
    'index': 1,
    'total': '998'
  }, {
    'account': '185****2828',
    'index': 2,
    'total': '997'
  }, {
    'account': '185****2828',
    'index': 3,
    'total': '996'
  }, {
    'account': '185****2828',
    'index': 4,
    'total': '995'
  }, {
    'account': '185****2828',
    'index': 5,
    'total': '994'
  }, {
    'account': '185****2828',
    'index': 6,
    'total': '993'
  }, {
    'account': '185****2828',
    'index': 7,
    'total': '992'
  }, {
    'account': '185****2828',
    'index': 8,
    'total': '991'
  }, {
    'account': '185****2828',
    'index': 9,
    'total': '990'
  }, {
    'account': '185****2828',
    'index': 10,
    'total': '989'
  }];

  Widget bannerWidget () {
    return Stack(
      children: <Widget>[
        Image.asset("images/rank_banner.png"),
        Positioned(
          top: Px.px(60),
          left: Px.px(0),
          child: Container(
            width: Px.px(750),
            alignment: Alignment.center,
            child: Text('通过粉巷APP赚取收入!', style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: Px.px(40),
            ),),
          ),
        ),
        Positioned(
          top: Px.px(150),
          left: Px.px(0),
          child: Container(
            width: Px.px(750),
            alignment: Alignment.center,
            child: GestureDetector(
              child: Container(
                width: Px.px(374),
                height: Px.px(60),
                color: Color(0xFFFFFFFF),
                alignment: Alignment.center,
                child: Text("点击复制邀请文案", style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: Px.px(32)
                ),),
              ),
              onTap: () {
                Toast.show('邀请文案已复制,快去粘贴邀请吧。', context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
              },
            ),
          ),
        )
      ],
    );
  }

  Widget rankTitleWidget () {
    List<Widget> invitationListTitleWidget = [];
    for (var i = 0; i < ['排名', '邀请人账号', '邀请数量'].length; i++) {
      invitationListTitleWidget.add(Expanded(
          flex: i == 1 ? 2 : 1,
          child: Container(
            alignment: Alignment.center,
            child: Text(['排名', '邀请人账号', '邀请数量'][i], style: TextStyle(fontSize: Px.px(28), color: Color(0xFFA0AAAD)),),
          )
      ));
    }
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, Px.px(20)),
      child: Row(
        children: invitationListTitleWidget,
      ),
    );
  }

  Widget rankWidget () {
    List<Widget> rankListWidget = [];
    for (var i = 0; i < rankList.length; i++) {
      rankListWidget.add(Container(
        height: Px.px(80),
        width: Px.px(670),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: i < 3 ? Image.asset(
                    "images/${rankList[i]['index']}.png",
                    height: Px.px(30),
                    fit: BoxFit.contain,
                  ) : Text(
                    "${rankList[i]['index']}",
                    style: TextStyle(fontSize: Px.px(24), color: Color(0xFFA0AAAD)),
                  ),
                )
            ),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("${rankList[i]['account']}", style: TextStyle(fontSize: Px.px(24), color: Color(0xFFA0AAAD)),),
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("${rankList[i]['total']}", style: TextStyle(fontSize: Px.px(24), color: Color(0xFFA0AAAD)),),
                )
            ),
          ],
        ),
      ));
    }
    return ListView(
      shrinkWrap: true,
      controller: _controller,
      children: rankListWidget,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        title: Text("邀请赚钱", style: TextStyle(
          color: Color(0xFF666666)
        ),),
        elevation: 0,
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body: ListView(
        children: <Widget>[
          bannerWidget(),
          Container(
            padding: EdgeInsets.all(Px.px(40)),
            child: Column(
              children: <Widget>[
                rankTitleWidget(),
                rankWidget()
              ],
            ),
          )
        ],
      ),
    );
  }
}