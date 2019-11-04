import 'package:flutter/material.dart';
import '../../local_modules/px.dart';

class Income extends StatefulWidget {
  @override
  _Income createState() => _Income();
}

class _Income extends State<Income> with TickerProviderStateMixin <Income> {
  ScrollController _controller = new ScrollController();

  var incomeList = [{
    'account': '185****2828',
    'behaviorNum': 21.00,
    'surplus': 29.00,
    'behavior': '提现',
    'time': '2019年11月'
  }, {
    'account': '185****2828',
    'behaviorNum': 21.00,
    'surplus': 29.00,
    'behavior': '月结发钱',
    'time': '2019年11月'
  }, {
    'account': '185****2828',
    'behaviorNum': 21.00,
    'surplus': 29.00,
    'behavior': '月结发钱',
    'time': '2019年11月'
  }, {
    'account': '185****2828',
    'behaviorNum': 21.00,
    'surplus': 29.00,
    'behavior': '提现',
    'time': '2019年11月'
  }];

  Widget _incomeWidget () {
    List<Widget> incomeListWidget = [];

    for (var item in incomeList) {
      incomeListWidget.add(Container(
        height: Px.px(100),
        color: Color(0xFFFFFFFF),
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, Px.px(2)),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.fromLTRB(Px.px(40), 0.0, 0.0, 0.0),
                child: Text(item['time'], style: TextStyle(
                    color: Color(0xFF5C5C5C),
                    fontSize: Px.px(32)
                ),),
              )
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, Px.px(8), 0.0, Px.px(4)),
                    child: Text('${item['behavior'] == '提现' ? '- ' : '+ '}${item['behaviorNum']}', style: TextStyle(
                        fontSize: Px.px(28),
                        color: item['behavior'] == '提现' ? Color(0xFF0b8235) : Color(0xFFf81d22)
                    ),),
                  ),
                  Text(item['behavior'], style: TextStyle(
                    color: Color(0xFF5C5C5C),
                    fontSize: Px.px(32)
                  ),)
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text('${item['surplus']}', style: TextStyle(
                fontSize: Px.px(32),
                color: Color(0xFF5C5C5C)
              ),),
            )
          ],
        ),
      ));
    }

    return ListView(
      shrinkWrap: true,
      controller: _controller,
      children: incomeListWidget,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        title: Text('收入明细'),
        backgroundColor: Color(0xFFE88683),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0.0, Px.px(20), 0.0, Px.px(20)),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(Px.px(40), 0.0, Px.px(40), 0.0),
              child: RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: '粉项将于每个月的28号结算上个自然月(每月1号-每月最后一日)有效拉新用户降级',
                          style: TextStyle(
                              color: Color(0xFF5C5C5C),
                              fontSize: Px.px(28)
                          )
                      )
                    ]
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(Px.px(40), Px.px(20), Px.px(40), Px.px(20)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text('日期', style: TextStyle(
                        color: Color(0xFF5C5C5C),
                        fontSize: Px.px(32)
                    ),),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('结余(元)', style: TextStyle(
                      color: Color(0xFF5C5C5C),
                      fontSize: Px.px(32)
                    ),),
                  )
                ],
              ),
            ),
            _incomeWidget()
          ],
        ),
      ),
    );
  }
}