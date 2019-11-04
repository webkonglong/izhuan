import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../../local_modules/px.dart';


class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text('联系我们'),
        backgroundColor: Color(0xFFE88683),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(Px.px(40), Px.px(40), Px.px(40), Px.px(20)),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, Px.px(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('微信', style: TextStyle(
                      fontSize: Px.px(32),
                      color: Color(0xFF5C5C5C)
                  ),),
                  GestureDetector(
                    child: Text('webkonglong', style: TextStyle(
                        fontSize: Px.px(32),
                        color: Color(0xFF5C5C5C)
                    ),),
                    onTap: () {
                      Toast.show('微信号已复制', context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, Px.px(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('QQ', style: TextStyle(
                      fontSize: Px.px(32),
                      color: Color(0xFF5C5C5C)
                  ),),
                  GestureDetector(
                    child: Text('1250888888', style: TextStyle(
                        fontSize: Px.px(32),
                        color: Color(0xFF5C5C5C)
                    ),),
                    onTap: () {
                      Toast.show('QQ号已复制', context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, Px.px(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('邮箱', style: TextStyle(
                      fontSize: Px.px(32),
                      color: Color(0xFF5C5C5C)
                  ),),
                  GestureDetector(
                    child: Text('anmingzhe@me.com', style: TextStyle(
                        fontSize: Px.px(32),
                        color: Color(0xFF5C5C5C)
                    ),),
                    onTap: () {
                      Toast.show('邮箱号已复制', context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}