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

class FindHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: false,
          slivers: <Widget>[
            // SliverAppBar(
            //   backgroundColor: Colors.transparent,
            //   flexibleSpace: HeartImgWidget(Image.asset(
            //       Constant.ASSETS_IMG + 'bg_person_center_default.webp')),
            //   expandedHeight: 200.0,
            // ),
            SliverToBoxAdapter(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 15.0, bottom: 20.0, right: 10.0),
                    child: Image.asset(
                      Constant.ASSETS_IMG + 'ic_notify.png',
                      width: 30.0,
                      height: 30.0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '首页找车',
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
