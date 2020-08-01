/*
 * @Author: your name
 * @Date: 2020-07-12 20:16:29
 * @LastEditTime: 2020-07-12 20:16:29
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /hsk_flutter/lib/pages/FindPageWidget.dart
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FindHomePage extends StatelessWidget {
  List imgList = [
    "http://file02.16sucai.com/d/file/2014/0617/be2f5973a60156df0c6aeb2aace791c6.jpg",
    "http://gss0.baidu.com/9vo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/3b292df5e0fe99257d8c844b34a85edf8db1712d.jpg",
    "http://cache.5ikfc.com/imgs/kfc/2014/05/quanjiatong.jpg",
  ];

/**
 * 
 *  extAlign: TextAlign.center, //文本对齐方式  居中
 *  textDirection: TextDirection.ltr, //文本方向
 *  softWrap: false, //是否自动换行 false文字不考虑容器大小  单行显示   超出；屏幕部分将默认截断处理
 *  overflow: TextOverflow
 *   .ellipsis, //文字超出屏幕之后的处理方式  TextOverflow.clip剪裁   TextOverflow.fade 渐隐  TextOverflow.ellipsis省略号
 * textScaleFactor: 2.0, //字体显示的赔率
 *   maxLines: 10, //最大行数
 *  style: new TextStyle(
 *   decorationColor: const Color(0xffffffff), //线的颜色
 * decoration: TextDecoration
 *   .none, //none无文字装饰   lineThrough删除线   overline文字上面显示线    underline文字下面显示线
 *  decorationStyle: TextDecorationStyle
 *  .solid, //文字装饰的风格  dashed,dotted虚线(简短间隔大小区分)  double三条线  solid两条线
 *    wordSpacing: 0.0, //单词间隙(负值可以让单词更紧凑)
 *    letterSpacing: 0.0, //字母间隙(负值可以让字母更紧凑)
 *    fontStyle: FontStyle.italic, //文字样式，斜体和正常
 *  fontSize: 20.0, //字体大小
 *  fontWeight: FontWeight.w900, //字体粗细  粗体和正常
 *  color: const Color(0xffffffff), //文字颜色  ),
 */

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 230,
            title: Text('聚马车队'),
            flexibleSpace: Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: rendSwiper(),
            ),
          )
        ];
      },
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 100,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            color: Colors.primaries[index % Colors.primaries.length],
            alignment: Alignment.center,
            child: Text(
              '$index',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget rendSwiper() {
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.network(imgList[index], fit: BoxFit.fitWidth);
      },
      itemHeight: 60,
      itemWidth: 50,
      autoplay: true,
      duration: 300,
      itemCount: 3,
      // pagination: new SwiperPagination(),
      //control: new SwiperControl(),
    );
  }

  Widget renderCenter() {
    return GridView.builder(
      itemCount: 5,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      // itemBuilder: (context, index) {
      //   return Programme(data: programmeList[index]);
      // },
    );
  }
}
