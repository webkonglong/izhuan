import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0, 0); //第1个点
    path.lineTo(0, size.height - 40.0); //第2个点
    var firstControlPoint = Offset(size.width/2, size.height-60); //第一段曲线控制点

    var secondEndPoint = Offset(size.width, size.height-40); //第二段曲线结束点
    path.quadraticBezierTo( //形成曲线
        firstControlPoint.dx,
        firstControlPoint.dy,
        secondEndPoint.dx,
        secondEndPoint.dy);

    path.lineTo(size.width, size.height-40);
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

  Widget _buildSwiperImageWidget() {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      height: ScreenUtil().setHeight(234),
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
                height: ScreenUtil().setHeight(234),
                child: Stack(
                  children: <Widget>[
                      Container(
                        // height: ScreenUtil().setHeight(234),
                        child: CachedNetworkImage(
                          fadeOutDuration: const Duration(milliseconds: 234),
                          fadeInDuration: const Duration(milliseconds: 750),
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
          pagination: SwiperPagination(),
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

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildSwiperImageWidget(),
      ],
    );
  }
}
