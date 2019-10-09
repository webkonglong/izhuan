import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class Bar extends StatefulWidget {
  @override
  barState createState() {
    return barState();
  }
}

class barState extends State<Bar>  {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Container(
      padding: new EdgeInsets.fromLTRB( 0.0, ScreenUtil().setHeight(10), 0.0, 0.0),
      constraints: new BoxConstraints.expand(
        height: ScreenUtil().setHeight(170),
      ),
      child: Column(
        children: <Widget>[
          Container(
            constraints: new BoxConstraints.expand(
              height: ScreenUtil().setHeight(80),
            ),
            decoration: new BoxDecoration(
              border: new Border.all(width: 1.0, color: const Color(0xFFEDEDED)),
              borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
              color: const Color(0xFFFFFFFF),
            ),
            padding: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(38), 0.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: new TextField(
                      controller: controller,
                      style: new TextStyle(
                        color: const Color(0xFF949494),
                        fontSize: ScreenUtil().setSp(38),
                      ),
                      cursorColor: const Color(0xFF949494),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        hintText: '请输入关键词',
                        hintStyle: new TextStyle(
                          color: const Color(0xFF949494),
                          fontSize: ScreenUtil().setSp(38),
                        ),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (text) {
                        print(controller.text);
                      },
                    ),
                  ),
                ),
                GestureDetector(
                    child: Container(
                      margin: new EdgeInsets.fromLTRB(0.0, 0.0, ScreenUtil().setWidth(20), 0.0),
                      child: Image.asset(
                        "images/search_icon.png",
                        width: ScreenUtil().setWidth(54),
                        height: ScreenUtil().setHeight(54),
                      ),
                    ),
                    onTap: () {
                      print(controller.text);
                    }
                ),
              ],
            ),
          ),
          Text('ceshi', style: TextStyle(
              fontSize: 20.0
          ))
        ],
      ),
    );
  }
}