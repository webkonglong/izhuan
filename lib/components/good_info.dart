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
  // ScrollController _controller = new ScrollController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
        backgroundColor: Color(0xFFE88683),
      ),
      body: ListView(
        // shrinkWrap: true,
        // controller: _controller,
        children: <Widget>[
          CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: widget.info['pict_url'],
            width: Px.px(750),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
        ],
      )
    );
  }
}