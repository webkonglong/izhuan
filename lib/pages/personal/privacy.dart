import 'package:flutter/material.dart';
import '../../local_modules/px.dart';


class Privacy extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text('隐私保护'),
        backgroundColor: Color(0xFFE88683),
      ),
      body: Container(
        // padding: EdgeInsets.fromLTRB(Px.px(40), Px.px(20), Px.px(40), Px.px(20)),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(Px.px(40), Px.px(40), Px.px(40), Px.px(20)),
              child: Text('关于首页 猜你喜欢:', style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: Px.px(28)
              ),),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(Px.px(40), 0.0, Px.px(40), Px.px(20)),
              child: RichText(
                maxLines: 16,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: '        首页猜你喜欢商品和你近期在淘宝APP浏览的商品近似,是因为淘宝APP会记录浏览淘宝APP的手机IMEI码来做大数据分析,然后给你推荐商品,淘宝不会记录你的淘宝账号,只是记录手机IMEI码。粉巷APP拿到您手机的IMEI码去交给淘宝,淘宝会根据IMEI码做大数据分析然后返回你可能喜欢的商品。手机IMEI码每一个手机都不一样,相当于手机的身份证号码是手机系统提供给软件开发者的一个很常用信息,所以这栏目没有获取到你的任何隐私,淘宝APP只是记录了某一个手机在他们平台浏览过什么商品,我们把每一个手机的编码提供给淘宝,淘宝去分析推荐给我们每一个手机可能感兴趣的商品。所以粉巷没有偷窥您的隐私。',
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
              margin: EdgeInsets.fromLTRB(Px.px(40), Px.px(40), Px.px(40), Px.px(20)),
              child: Text('关于下级订单隐私:', style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: Px.px(28)
              ),),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(Px.px(40), 0.0, Px.px(40), Px.px(20)),
              child: RichText(
                maxLines: 16,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: '        粉巷APP是有推广返佣规则,您推广把粉巷APP推广给了你的朋友,您的朋友在粉巷APP领劵购物后,你可以自动得到佣金,但粉巷APP并不会告诉您 您的朋友具体买了什么,但是为了让您相信粉巷APP给你返佣金,您的朋友每次领劵购买所花费的金额,粉巷APP都会告诉你,也就是说您每次在粉巷APP领劵购买商品 给你推广的人并不知道你具体购买了什么,他只知道你买了一件商品 花费了多少钱而已。',
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
        ),
      ),
    );
  }
}