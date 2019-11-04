import 'package:flutter/material.dart';
import '../../local_modules/px.dart';

class Invitation extends StatefulWidget {
  @override
  _Invitation createState() => _Invitation();
}

class _Invitation extends State<Invitation> with TickerProviderStateMixin <Invitation> {
  ScrollController _controller = new ScrollController();

  var invitationList = [{
    'account': '185****2828',
    'type': 0,
    'time': '59:59 09/01'
  }, {
    'account': '185****2828',
    'type': 1,
    'time': '59:59 09/01'
  }, {
    'account': '185****2828',
    'type': 1,
    'time': '59:59 09/01'
  }, {
    'account': '185****2828',
    'type': 0,
    'time': '59:59 09/01'
  }];

  Widget _invitationListWidget () {
    List<Widget> invitationListWidget = [];
    for (var item in invitationList) {
      invitationListWidget.add(Container(
        height: Px.px(80),
        width: Px.px(670),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  child: Text(item['account'], style: TextStyle(fontSize: Px.px(24), color: Color(0xFF666666)),),
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  child: Text(item['time'], style: TextStyle(fontSize: Px.px(24), color: Color(0xFFA0AAAD)),),
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  child: Text(item['type'] == 0 ? '未生效' : '已生效', style: TextStyle(fontSize: Px.px(24), color: item['type'] == 0 ? Color(0xFFA0AAAD) : Color(0xFF666666)),),
                )
            ),
          ],
        ),
      ));
    }
    return ListView(
      shrinkWrap: true,
      controller: _controller,
      children: invitationListWidget,
    );
  }

  Widget _invitationListTitleWidget () {
    List<Widget> invitationListTitleWidget = [];
    for (var i = 0; i < ['账号', '时间', '状态'].length; i++) {
      invitationListTitleWidget.add(Expanded(
          flex: i == 0 ? 2 : 1,
          child: Container(
            child: Text(['账号', '时间', '状态'][i], style: TextStyle(fontSize: Px.px(28), color: Color(0xFFA0AAAD)),),
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text('邀请记录'),
        backgroundColor: Color(0xFFE88683),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(Px.px(40), Px.px(20), Px.px(40), Px.px(20)),
        child: Column(
          children: <Widget>[
            _invitationListTitleWidget(),
            _invitationListWidget()
          ],
        ),
      ),
    );
  }
}