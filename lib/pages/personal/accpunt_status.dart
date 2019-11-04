import 'package:flutter/material.dart';
import '../../local_modules/px.dart';

class AccpuntStatus extends StatefulWidget {
  @override
  _AccpuntStatus createState() => _AccpuntStatus();
}

class _AccpuntStatus extends State<AccpuntStatus> with TickerProviderStateMixin <AccpuntStatus> {
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text('等级与规则'),
        backgroundColor: Color(0xFFE88683),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, Px.px(20)),
            padding: EdgeInsets.fromLTRB(Px.px(20), 0.0, 0.0, 0.0),
            color: Color(0xFFF4F4F4),
            width: Px.px(750),
            height: Px.px(68),
            child: Row(
              children: <Widget>[
                Text(
                  "规则",
                  style: TextStyle(
                    color: Color(0xFF5C5C5C),
                    fontSize: Px.px(28),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, Px.px(20)),
            padding: EdgeInsets.fromLTRB(Px.px(20), 0.0, Px.px(20), 0.0),
            width: Px.px(750),
            height: Px.px(168),
            child: RichText(
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '        为了给推广者提供更全面优质的服务，粉巷计划对粉巷推广能力等级进行升级，根据推广者的能力推广，服务销售费规模等进行考核，佣金结算等权益与推广者身份等级具有关联性，详细规则如下:',
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
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, Px.px(20)),
            padding: EdgeInsets.fromLTRB(Px.px(20), 0.0, Px.px(20), 0.0),
            width: Px.px(750),
            height: Px.px(168),
            child: RichText(
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '        粉巷推广者将氛围1级,2级两个推广能力等级。默认初始为1级,邀请1位有效用户可升为2级。被邀请人需有在粉巷app领卷下单,才算有效用户。',
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
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, Px.px(20)),
            padding: EdgeInsets.fromLTRB(Px.px(20), 0.0, 0.0, 0.0),
            color: Color(0xFFF4F4F4),
            width: Px.px(750),
            height: Px.px(68),
            child: Row(
              children: <Widget>[
                Text(
                  "特权",
                  style: TextStyle(
                    color: Color(0xFF5C5C5C),
                    fontSize: Px.px(28),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, Px.px(20)),
            padding: EdgeInsets.fromLTRB(Px.px(20), 0.0, Px.px(20), 0.0),
            width: Px.px(750),
            height: Px.px(88),
            child: RichText(
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '        1级用户【自购】 除可领劵外,可额外获得返利,返利积攒100元可提现。',
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
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, Px.px(20)),
            padding: EdgeInsets.fromLTRB(Px.px(20), 0.0, Px.px(20), 0.0),
            width: Px.px(750),
            height: Px.px(228),
            child: RichText(
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '        2级用户【自购】除可领劵外,可额外获得返利是1级返利金额的2倍,并且提现金额无限制,1分也可提现。2级用户邀请用户B,B【自购】后,2级用户可获取B返利的66%(无论B是1级用户还是2级用户,此返利只按照1级用户返利),B也可以完成邀请用户升级2级,返利互相不影响',
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
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, Px.px(20)),
            padding: EdgeInsets.fromLTRB(Px.px(20), 0.0, 0.0, 0.0),
            color: Color(0xFFF4F4F4),
            width: Px.px(750),
            height: Px.px(68),
            child: Row(
              children: <Widget>[
                Text(
                  "名词解释",
                  style: TextStyle(
                    color: Color(0xFF5C5C5C),
                    fontSize: Px.px(28),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, Px.px(20)),
            padding: EdgeInsets.fromLTRB(Px.px(20), 0.0, Px.px(20), 0.0),
            width: Px.px(750),
            height: Px.px(128),
            child: RichText(
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '自购 ==>  自己领劵购买,或者发送商品领劵口令或商品领劵链接或商品领劵二维码等 发送各种社交平台  别人看见后 领劵购买，均属于自购',
                        style: TextStyle(
                            color: Color(0xFF5C5C5C),
                            fontSize: Px.px(28)
                        )
                    )
                  ]
              ),
            ),
          ),
        ],
      )
    );
  }
}






