import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../local_modules/px.dart';

class GoodInfo extends StatefulWidget {
  dynamic info;
  GoodInfo({this.info});
  @override
  _GoodInfo createState() => _GoodInfo();
}


class _GoodInfo extends State<GoodInfo> with TickerProviderStateMixin <GoodInfo> {
  var bannerIndex = 0;

  Widget titleWidget () {
    return RichText(
      text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: widget.info['user_type'] == 0 ? "淘宝 " : "天猫 ",
              style: TextStyle(fontSize: Px.px(32), color: Color(0xFFE88683), fontWeight: FontWeight.w700),
            ),
            TextSpan(
              text: widget.info['tao_title'],
              style: TextStyle(fontSize: Px.px(32),color: Color(0xFF333333),),
            ),
          ]
      ),
    );
  }

  Widget picWidget () {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0.0, Px.px(10), 0.0, Px.px(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('已售${widget.info['sellCount']}件', style: TextStyle(
                fontSize: Px.px(24),
                color: Color(0xFFA9A9A9),
              )),
              Text('邀请3人升高级预估可赚20.09元', style: TextStyle(
                fontSize: Px.px(24),
                color: Color(0xFF333333),
              )),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '￥ ',
                        style: TextStyle(
                            fontSize: Px.px(24),
                            color: Color(0xFFE88683)
                        ),
                      ),
                      TextSpan(
                        text: widget.info['quanhou_jiage'] + '  ',
                        style: TextStyle(
                          fontSize: Px.px(40),
                          color: Color(0xFFE88683),
                          fontWeight: FontWeight.w800,),
                      ),
                      TextSpan(
                        text: '￥ ',
                        style: TextStyle(
                            fontSize: Px.px(24),
                            color: Color(0xFFA1A1A1)
                        ),
                      ),
                      TextSpan(
                        text: widget.info['size'],
                        style: TextStyle(
                          fontSize: Px.px(24),
                          color: Color(0xFFA1A1A1),
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Color(0xFFA1A1A1),
                          decorationStyle: TextDecorationStyle.solid,),
                      ),
                    ]
                ),
              ),
              Container(
                padding: new EdgeInsets.fromLTRB(Px.px(20), Px.px(6), Px.px(20), Px.px(6)),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(6.0)),
                  color: Color(0xFFC51E13),
                ),
                child: Text("预估赚${widget.info['tkfee3']}", style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: Px.px(28),
                ),textAlign: TextAlign.center,),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget paddingWidget () {
    return Container(
      padding: EdgeInsets.all(Px.px(20)),
      child: Column(
        children: <Widget>[
          titleWidget(),
          picWidget()
        ],
      ),
    );
  }

  Widget pcDescContentWidget () {
    var urlArr = widget.info['pcDescContent'].split('|');
    List<Widget> pcDescContentWidgetList = [];
    pcDescContentWidgetList.add(Container(
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, Px.px(20)),
      child: Text('商品详情', style: TextStyle(
        fontSize: Px.px(34),
        color: Color(0xFF333333)
      ),),
    ));
    for (var url in urlArr) {
      pcDescContentWidgetList.add(CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: 'https:${url}',
        width: Px.px(750),
        errorWidget: (context, url, error) => new Icon(Icons.error),
      ),);
    }

    return Container(
      padding: EdgeInsets.fromLTRB(Px.px(20), 0.0, Px.px(20), 0.0),
      child: Column(
        children: pcDescContentWidgetList,
      ),
    );
  }

  Widget couponWidget () {
    return Container(
      width: Px.px(750),
      height: Px.px(100),
      padding: EdgeInsets.fromLTRB(Px.px(80), 0.0, Px.px(80), 0.0),
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, Px.px(30)),
      child: GestureDetector(
        child: Container(
          height: Px.px(100),
          width: Px.px(590),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(Px.px(15))),
            color: Color(0xFFE88683),
          ),
          alignment: Alignment.center,
          child: Text('${widget.info['coupon_info_money']}元劵', style: TextStyle(fontSize: Px.px(48),color: Color(0xFFFFFFFF),)),
        ),
        onTap: () {
          print('应该去tb了');
        },
      )
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
        backgroundColor: Color(0xFFE88683),
      ),
      body: ListView(
        children: <Widget>[
          CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: widget.info['pict_url'],
            width: Px.px(750),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
          paddingWidget(),
          couponWidget(),
          pcDescContentWidget(),
        ],
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          GestureDetector(
            child: Container(
              height: Px.px(100),
              width: Px.px(375),
              color: Color(0xFFE88683),
              alignment: Alignment.center,
              child: Text('自买领', style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: Px.px(32)
              ),),
            ),
            onTap: () {
              print('去淘宝领');
            },
          ),
          GestureDetector(
            child: Container(
              height: Px.px(100),
              width: Px.px(375),
              color: Color(0xFFC51E13),
              alignment: Alignment.center,
              child: Text('分享赚', style: TextStyle(
                fontSize: Px.px(32),
                color: Color(0xFFFFFFFF)
              ),),
            ),
            onTap: () {
              print('分享赚');
            },
          ),
        ],
      ),
    );
  }
}