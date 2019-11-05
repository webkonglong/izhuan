import 'package:flutter/material.dart';
import '../../local_modules/px.dart';


class Novice extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text('新手引导'),
        backgroundColor: Color(0xFFE88683),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Color(0xFFFBF5E5),
            padding: EdgeInsets.all(Px.px(40)),
            child: RichText(
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '        粉巷APP有上千万的淘宝,天猫商品,(后期也会加入拼多多以及京东商品), 您要做的只是把好的商品分享出去,或者推广粉项APP 就可以赚钱,',
                        style: TextStyle(
                            color: Color(0xFF5C5C5C),
                            fontSize: Px.px(28)
                        )
                    ),
                    TextSpan(
                        text: '不用囤货,不用发货,无任何费用,0成本,0风险,',
                        style: TextStyle(
                            color: Color(0xFFE88683),
                            fontSize: Px.px(28)
                        )
                    ),
                    TextSpan(
                        text: '产生成交就有佣金拿,多劳多得,上不封顶。',
                        style: TextStyle(
                            color: Color(0xFF5C5C5C),
                            fontSize: Px.px(28)
                        )
                    ),
                  ]
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(Px.px(40), Px.px(20), Px.px(40), Px.px(20)),
            child: Text('粉巷APP 商业逻辑:', style: TextStyle(
                color: Color(0xFF333333),
                fontSize: Px.px(28)
            ),),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(Px.px(40), 0.0, Px.px(40), Px.px(20)),
            child: RichText(
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '        商家出内部优惠劵以及返利做活动增加销量,您推广商家商品或者粉巷APP,可拿下线返利,下线购买淘宝天猫等商品可用内部优惠劵抵扣现金。',
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
            child: Text('粉巷APP 使用方法:', style: TextStyle(
                color: Color(0xFF333333),
                fontSize: Px.px(28)
            ),),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(Px.px(40), 0.0, Px.px(40), Px.px(20)),
            child: RichText(
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '1. 淘宝或天猫购买商品时,可以长按商品标题复制商品链接,或商品口令后打开粉巷APP,粉巷APP会自动识别您复制的商品链接或口令去搜索是否有优惠劵,基本都有优惠劵,一键复制优惠劵口令后打开淘宝APP后即可自动领劵(如果您没有注册粉巷APP,你只可以使用优惠劵,如果您注册了粉巷APP还可以得到商品的返利).',
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
            padding: EdgeInsets.fromLTRB(Px.px(40), 0.0, Px.px(40), Px.px(20)),
            child: RichText(
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '2. 你也可以在粉巷APP寻找您认为比较优秀的商品复制商品优惠劵口令和文案分享给好友,好友领劵购买后您可得返利佣金。',
                        style: TextStyle(
                            color: Color(0xFF5C5C5C),
                            fontSize: Px.px(28)
                        )
                    ),
                  ]
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(Px.px(40), 0.0, Px.px(40), Px.px(20)),
            child: RichText(
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '3. 你还可以向朋友推广粉巷APP,好友下载粉巷APP在粉巷APP领劵下单后,你也可以获得返利佣金',
                        style: TextStyle(
                            color: Color(0xFF5C5C5C),
                            fontSize: Px.px(28)
                        )
                    ),
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}










