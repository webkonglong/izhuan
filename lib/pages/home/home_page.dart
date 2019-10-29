import 'package:flutter/material.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../local_modules/px.dart';
import '../../local_modules/ajax.dart';

import '../../components/goods.dart';

// menu
import './large_volume.dart';
import './quick.dart';
import './supermarket.dart';
import './nine.dart';
import './tmall.dart';

var menuList = [{
  "index": 1,
  "icon": "images/homemenu/large_volume.png",
  "title": "大额劵"
}, {
  "index": 2,
  "icon": "images/homemenu/supermarket.png",
  "title": "天猫超市"
}, {
  "index": 3,
  "icon": "images/homemenu/tmall.png",
  "title": "天猫"
}, {
  "index": 4,
  "icon": "images/homemenu/quick.png",
  "title": "聚划算"
}, {
  "index": 5,
  "icon": "images/homemenu/99.png",
  "title": "9.9商品"
}];

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0, 0); //第1个点
    path.lineTo(0, size.height - 00); //第2个点
    var firstControlPoint = Offset(size.width/2, size.height-20); //第一段曲线控制点

    var secondEndPoint = Offset(size.width, size.height-0); //第二段曲线结束点
    path.quadraticBezierTo( //形成曲线
        firstControlPoint.dx,
        firstControlPoint.dy,
        secondEndPoint.dx,
        secondEndPoint.dy);

    path.lineTo(size.width, size.height - 0);
    path.lineTo(size.width, 0);

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _HomePage extends State<HomePage> with TickerProviderStateMixin <HomePage> {
  List<String> banner_images = [
    'https://gw.alicdn.com/imgextra/i2/154/O1CN01zGsKmE1D0ZWctLP1s_!!154-0-lubanu.jpg',
    'https://aecpm.alicdn.com/simba/img/TB15tIjGVXXXXcoapXXSutbFXXX.jpg',
    'https://gw.alicdn.com/imgextra/i3/134/O1CN010A8j9R1CrPbVK6mQK_!!134-0-lubanu.jpg',
    'https://gw.alicdn.com/imgextra/i4/15/O1CN01Igfnec1ByuTKLRgp1_!!15-0-lubanu.jpg'
  ];

  var datas = [];
  var page = 1;
  var isLoading = false;
  var end = false;

  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    ImeiPlugin.getImei().then((resp) => {
      print(resp)
    });

    getData();
    _controller.addListener(() {
      if (!end && !isLoading && _controller.position.pixels == _controller.position.maxScrollExtent) {
        print("底部了");
        page = page + 1;
        getData();
        setState(() {
          isLoading = true;
        });
      }
    });

    super.initState();
  }

  getData () {
    ajax({
      'type': 'get',
      'url': 'https://api.zhetaoke.com:10001/api/api_xiaoshi.ashx',
      'data': {
        'appkey': 'f1c7c24c8e0c43a0860799a0448ff523',
        'page_size': 20,
        'page': page,
        'cid': '',
        'sort': 'new'
      },
      'success': (resp) {
        if (!end && resp.length == 20) {
          datas.addAll(resp);
          setState(() {
            datas = datas;
            isLoading = false;
          });
        } else {
          if (mounted) {
            datas.addAll(resp);
            setState(() {
              datas = datas;
              end = true;
              isLoading = false;
            });
          }
        }
      },
      'error': (err) {
        print(err);
      }
    });
  }


  Widget _buildSwiperImageWidget() {

    return Container(
      height: Px.px(234),
      child: ClipPath(
        clipper: ArcClipper(),
        child: Swiper(
          index: 0,
          loop: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print("this is what?");
                print(banner_images[index]);
              },
              child: Container(
                child: Stack(
                  children: <Widget>[
                      Container(
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: banner_images[index],
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                        ),
                      ),
                  ],
                ),
              )
            );
          },
          itemCount: banner_images.length,
          control: null,
          pagination: null,
          autoplay: true,
          duration: 300,
          onTap: (index) {
            print("你点击了第$index个");
          },
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget _menuBuildWidget (context) {
    // menuList
    List<Widget> menuListWidget = [];
    List<Widget> pageListWidget = [null, LargeVolume(), Supermarket(), Tmall(), Quick(), Nine()];

    for (var i = 0; i < menuList.length; i++) {
      menuListWidget.add(Expanded(
        flex: 1,
        child: GestureDetector(
          child: Column(
            children: <Widget>[
              Image.asset(
                menuList[i]['icon'],
                width: Px.px(100),
                height: Px.px(100),
              ),
              Container(
                margin: new EdgeInsets.fromLTRB(0.0, Px.px(6), 0.0, 0.0),
                child: Text(menuList[i]['title']),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
              return pageListWidget[menuList[i]['index']];
            }));
          },
        )
      ));
    }

    return Container(
      margin: EdgeInsets.fromLTRB(0.0, Px.px(10), 0.0, 0.0),
      child: Row(
        children: menuListWidget,
      ),
    );
  }

  Widget _goodsWidget () {
    return datas.length == 0 ? Container(
      padding: new EdgeInsets.fromLTRB(0.0, Px.px(20), 0.0, Px.px(20)),
      height: Px.px(80),
      child: Text("加载中～", style: TextStyle(
        fontSize: Px.px(28),
        color: Color(0xFFE88683),
      ),textAlign: TextAlign.center,),
    ) : Goods(datas, isLoading, end);
  }

  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      controller: _controller,
      children: <Widget>[
        _buildSwiperImageWidget(),
        _menuBuildWidget(context),
        _goodsWidget()
      ],
    );
  }
}
