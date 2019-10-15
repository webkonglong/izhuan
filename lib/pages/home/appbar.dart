import 'package:flutter/material.dart';
import '../../local_modules/px.dart';



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

    return Container(
      padding: new EdgeInsets.fromLTRB( 0.0, 0.0, 0.0, 0.0),
      constraints: new BoxConstraints.expand(
        height: Px.px(70),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            constraints: new BoxConstraints.expand(
              height: Px.px(70),
            ),
            decoration: new BoxDecoration(
              border: new Border.all(width: 1.0, color: const Color(0xFFEDEDED)),
              borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
              color: const Color(0xFFFFFFFF),
            ),
            padding: new EdgeInsets.fromLTRB(Px.px(32), 0.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: new TextField(
                      controller: controller,
                      style: new TextStyle(
                        color: const Color(0xFF949494),
                        fontSize: Px.px(30),
                      ),
                      cursorColor: const Color(0xFF949494),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        hintText: '请输入关键词',
                        hintStyle: new TextStyle(
                          color: const Color(0xFF949494),
                          fontSize: Px.px(32),
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
                      margin: new EdgeInsets.fromLTRB(0.0, 0.0, Px.px(20), 0.0),
                      child: Image.asset(
                        "images/search_icon.png",
                        width: Px.px(54),
                        height: Px.px(54),
                      ),
                    ),
                    onTap: () {
                      print(controller.text);
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}