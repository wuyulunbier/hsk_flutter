/*
 * @Author: your name
 * @Date: 2020-08-03 21:39:52
 * @LastEditTime: 2020-08-09 17:12:15
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /hsk_flutter/lib/login/RoleItem.dart
 */
/**
 * 
 * 相当于cell
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsk_flutter/res/resources.dart';
import "package:hsk_flutter/util/screen_utils.dart";

class RoleItem extends StatelessWidget {
  const RoleItem(
      {Key key,
      this.onTap,
      @required this.title,
      @required this.imgUrl,
      this.content = '',
      this.textAlign = TextAlign.start,
      this.maxLines = 1})
      : super(key: key);

  final GestureTapCallback onTap;
  final String title;
  final String imgUrl;
  final String content;
  final TextAlign textAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
/**
 *  采用先申明控件 在返回页面
 */
    Widget child = Container(
      child: Container(
          width: ScreenUtils.screenW(context),
          height: (ScreenUtils.screenH(context) - 200) / 2,
          color: Colors.white,
          //padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  //  alignment: Alignment.center,
                  height: 150,
                  width: 150,
                  child: IconButton(
                    icon: Image.asset(
                      imgUrl,
                      height: 150,
                      width: 150,
                      // color: Colours.wh,
                      fit: BoxFit.cover,
                    ),
                    onPressed: onTap,
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 400,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                color: Colors.white,
                child: Text(title),
                alignment: Alignment.center,
              )
            ],
          )),
    );
    return InkWell(
      //InkWell组件在用户点击时出现“水波纹”效果
      onTap: onTap,
      child: child,
    );
  }
}
