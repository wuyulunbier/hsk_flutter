/*
 * @Author: your name
 * @Date: 2020-07-12 20:45:50
 * @LastEditTime: 2020-07-12 21:08:39
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /hsk_flutter/lib/compoents/splash_widget.dart
 */

import 'dart:async';

import 'package:flutter/material.dart'; //常用组件的包

import 'package:hsk_flutter/container_page.dart';
import "package:hsk_flutter/util/screen_utils.dart";

import 'package:hsk_flutter/constant/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';

/***
 *  image 的相关属性
 * fit 属性中有很多值可以设置 
 * BoxFit.cover	图片可能拉伸，也可能裁剪，但是充满容器
 * BoxFit.contain	全图居中显示但不充满，显示原比例
 * BoxFit.fill	全图显示且填充满，图片可能会拉伸
 * BoxFit.fitHeight	图片可能拉伸，可能裁剪，高度充满
 * BoxFit.fitWidth	图片可能拉伸，可能裁剪，宽度充满
 * BoxFit.scaleDown	效果和contain差不多， 但是只能缩小图片，不能放大图片
 * 
 * 
 * 
 * 控制child是否显示
 * 当offstage为true，控件隐藏； 当offstage为false，显示；
 * 当Offstage不可见的时候，如果child有动画等，需要手动停掉，Offstage并不会停掉动画等操作。
 *  const Offstage({ Key key, this.offstage = true, Widget child })
 */

///打开APP首页
class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() =>
      _SplashWidgetState(); //为StatefulWidget控件SplashWidget定义一个状态类
}

//定义了一个状态控件，继承自状态类State<SplashWidget>，<SplashWidget>指明这个状态控件是SplashWidget控件的
class _SplashWidgetState extends State<SplashWidget> {
  var container = ContainerPage();

  bool showAd = true;

  //return返回一个组件  如果包含有其他组件 使用chilid属性

  @override
  Widget build(BuildContext context) {
    print('build splash');
    return Stack(
      children: <Widget>[
        Offstage(
          child: container,
          offstage: showAd,
        ),
        Offstage(
          child: Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/home_v1.png',
                        height: ScreenUtils.screenH(context),
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                ),
                SafeArea(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment(1.0, 0.0),
                      child: Container(
                        margin: const EdgeInsets.only(right: 30.0, top: 20.0),
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                        child: CountDownWidget(
                          onCountDownFinishCallBack: (bool value) {
                            if (value) {
                              setState(() {
                                showAd = false;
                              });
                            }
                          },
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffEDEDED),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: Text(
                              '欢迎使用聚马车队',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))
              ],
            ),
            width: ScreenUtils.screenW(context),
            height: ScreenUtils.screenH(context),
          ),
          offstage: !showAd,
        )
      ],
    );
  }
}

class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;

  CountDownWidget({Key key, @required this.onCountDownFinishCallBack})
      : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var _seconds = 3;
  Timer _timer;

//组件的生命周期

  @override
  void initState() {
    super.initState();

    print("initState");
    _startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(CountDownWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();

    print("deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_seconds',
      style: TextStyle(fontSize: 17.0),
    );
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      if (_seconds <= 1) {
        widget.onCountDownFinishCallBack(true);
        _cancelTimer();
        return;
      }
      _seconds--;
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    _timer?.cancel();
  }
}
