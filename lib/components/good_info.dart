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
              style: TextStyle(fontSize: Px.px(28), color: Color(0xFFE88683), fontWeight: FontWeight.w700),
            ),
            TextSpan(
              text: widget.info['tao_title'],
              style: TextStyle(fontSize: Px.px(28),color: Color(0xFF333333),),
            ),
          ]
      ),
    );
  }
  
  Widget paddingWidget () {
    return Container(
      padding: EdgeInsets.all(Px.px(20)),
      child: Column(
        children: <Widget>[
          titleWidget()
        ],
      ),
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
          paddingWidget()
        ],
      )
    );
  }
}