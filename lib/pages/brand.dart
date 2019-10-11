import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Brand extends StatefulWidget {
  @override
  _BrandPage createState() => _BrandPage();
}

class _BrandPage extends State<Brand> with TickerProviderStateMixin <Brand> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      // height: ScreenUtil().setHeight(100),
      child: GridView.count(
          crossAxisCount: 3,
          padding: const EdgeInsets.all(4.0),
          //主轴间隔
          mainAxisSpacing: 20.0,
          //横轴间隔
          shrinkWrap: true,
          crossAxisSpacing: 4.0,
          children:<Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
          ]
      ),
    );
  }
}