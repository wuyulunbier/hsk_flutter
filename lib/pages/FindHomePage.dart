/*
 * @Author: your name
 * @Date: 2020-07-12 20:16:29
 * @LastEditTime: 2020-07-12 20:16:29
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /hsk_flutter/lib/pages/FindPageWidget.dart
 */
import 'package:flutter/material.dart';
import 'package:hsk_flutter/constant/constant.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FindHomePage extends StatelessWidget {
  List imgList = [
    "http://file02.16sucai.com/d/file/2014/0617/be2f5973a60156df0c6aeb2aace791c6.jpg",
    "http://gss0.baidu.com/9vo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/3b292df5e0fe99257d8c844b34a85edf8db1712d.jpg",
    "http://cache.5ikfc.com/imgs/kfc/2014/05/quanjiatong.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '聚马车队',
          ),
        ),
        backgroundColor: Colors.orange,
        body: Container(
          height: 200,
          margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: new Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.network(imgList[index], fit: BoxFit.fitWidth);
            },
            itemHeight: 100,
            itemWidth: 50,
            autoplay: true,
            duration: 300,
            itemCount: 3,
            // pagination: new SwiperPagination(),
            // control: new SwiperControl(),
          ),
        ));
  }

  //
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
