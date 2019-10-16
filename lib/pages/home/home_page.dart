import 'package:flutter/material.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../local_modules/px.dart';

import '../../local_modules/ajax.dart';

import '../../components/goods.dart';



var menuList1 = [{
  "jump_url": "",
  "pic_url": "https://gw.alicdn.com/tfs/TB1Wxi2trsrBKNjSZFpXXcXhFXa-183-144.png_.webp",
  "title": "天猫"
}, {
  "jump_url": "",
  "pic_url": "https://img.alicdn.com/tfs/TB10UHQaNjaK1RjSZKzXXXVwXXa-183-144.png?getAvatar=1_.webp",
  "title": "聚划算"
}, {
  "jump_url": "",
  "pic_url": "https://gw.alicdn.com/tfs/TB11rTqtj7nBKNjSZLeXXbxCFXa-183-144.png?getAvatar=1_.webp",
  "title": "天猫国际"
}, {
  "jump_url": "",
  "pic_url": "https://gw.alicdn.com/tps/TB1eXc7PFXXXXb4XpXXXXXXXXXX-183-144.png?getAvatar=1_.webp",
  "title": "外卖"
}, {
  "jump_url": "",
  "pic_url": "https://gw.alicdn.com/tfs/TB1CMf4tlnTBKNjSZPfXXbf1XXa-183-144.png?getAvatar=1_.webp",
  "title": "拍卖"
}];


var menuList2 = [{
  "jump_url": "",
  "pic_url": "https://gw.alicdn.com/tfs/TB1IKqDtpooBKNjSZFPXXXa2XXa-183-144.png_.webp",
  "title": "天猫超市"
}, {
  "jump_url": "",
  "pic_url": "https://gw.alicdn.com/tfs/TB1o0FLtyMnBKNjSZFoXXbOSFXa-183-144.png_.webp",
  "title": "充值中心"
}, {
  "jump_url": "",
  "pic_url": "https://gw.alicdn.com/tfs/TB15nKhtpkoBKNjSZFEXXbrEVXa-183-144.png?getAvatar=1_.webp",
  "title": "飞猪旅行"
}, {
  "jump_url": "",
  "pic_url": "https://gw.alicdn.com/tfs/TB1BqystrZnBKNjSZFrXXaRLFXa-183-144.png?getAvatar=1_.webp",
  "title": "领金币"
}, {
  "jump_url": "",
  "pic_url": "https://gw.alicdn.com/tfs/TB18P98tyQnBKNjSZFmXXcApVXa-183-144.png?getAvatar=1_.webp",
  "title": "分类"
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
          datas.addAll(resp);
          setState(() {
            datas = datas;
            end = true;
            isLoading = false;
          });
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

  Widget _menuBuildWidget () {
    // menuList

    List<Widget> menuListWidget1 = [];
    List<Widget> menuListWidget2 = [];
    for (var i = 0; i < menuList1.length; i++) {
      menuListWidget1.add(Expanded(
        flex: 1,
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: menuList1[i]['pic_url'],
            ),
            Container(
              margin: new EdgeInsets.fromLTRB(0.0, Px.px(10), 0.0, 0.0),
              child: Text(menuList1[i]['title']),
            ),
          ],
        ),
      ));
    }

    for (var i = 0; i < menuList2.length; i++) {
      menuListWidget2.add(Expanded(
        flex: 1,
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: menuList2[i]['pic_url'],
            ),
            Container(
              margin: new EdgeInsets.fromLTRB(0.0, Px.px(10), 0.0, 0.0),
              child: Text(menuList2[i]['title']),
            ),
          ],
        ),
      ));
    }

    return Column(
      children: <Widget>[
        Row(
          children: menuListWidget1,
        ),
        Row(
          children: menuListWidget2,
        ),
      ],
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
        _menuBuildWidget(),
        _goodsWidget()
      ],
    );
  }
}
