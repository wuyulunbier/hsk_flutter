/*
 * @Author: your name
 * @Date: 2020-08-08 17:52:36
 * @LastEditTime: 2020-08-09 22:03:36
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /hsk_flutter/lib/login/LoginPage.dart
 */
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:hsk_flutter/res/SharedPreferenceUtil.dart';
import 'package:provider/provider.dart';
import 'package:hsk_flutter/public.dart';
import 'package:hsk_flutter/widgets/button.dart';
import 'package:hsk_flutter/res/enum.dart';
import "package:hsk_flutter/util/screen_utils.dart";

import 'package:hsk_flutter/login/View/sign_in_page.dart';
import 'package:hsk_flutter/login/View/sign_up_page.dart';
import 'package:hsk_flutter/res/gradual_change_view.dart';

/**
 * audio_recorder: any #录音、播放
  flutter_sound: ^1.1.5#录音
  dropdown_menu: ^1.1.0#下拉菜单
  simple_permissions:#权限获取
  easy_alert:#弹框
  amap_location: any #高德地图
  location: any #gogle位置获取
  barcode_scan 0.0.8#二维码识别qr_mobile_vision: ^0.1.0 #二维码识别 这个不好用
  flutter_screenutil: ^0.3.0#屏幕适配工具类  
  flutter_spinkit: ^2.1.0#加载等待框
  lpinyin: ^1.0.6#汉字转拼音
  shimmer: ^0.0.4#微光效果控件
  qr_flutter: ^1.1.3#二维码生成
  url_launcher: any#启动URL的Flutter插件。支持网络，电话，短信和电子邮件
  datetime_picker_formfield: ^0.1.3#时间选择控件
  flutter_picker: '^1.0.0'#选择器
  common_utils: '^1.0.1'#工具类 时间、日期、日志等
  flutter_html: '^0.8.2'#静态html标记呈现为Flutter小部件
  fluwx: '^0.3.0'#微信支付、分享、登录
  tobias: '^ 0.0.6#支付宝
  cupertino_icons: '^0.1.2'#小图标控件
  http: '^0.11.3+16'#网络请求
  html: '^0.13.3'#html解析
  image_picker: '^0.4.5'#图片选择（相册或拍照）
  flutter_webview_plugin: any#webview展示
  fluttertoast: any#toast提示框
  shared_preferences: '^0.4.2'#shared_preferences存储
  transparent_image: '^0.1.0'#透明图片控件
  flutter_swiper : '^1.0.2'#轮播图
  charts_flutter: '^0.4.0'#统计图表
  path_provider: '^0.4.1'#获取系统文件
  cached_network_image: '0.4.1'#加载网络图片并本地缓存
  sqflite: '^0.11.0+1'#sqllite数据库操作
  pull_to_refresh: '^1.1.5'#下拉刷新上拉加载更多
  video_player: '0.6.1'#视频播放
  collection: '1.14.11'#集合操作工具类
  device_info: '0.2.1'#获取手机信息
  flutter_svg: '^0.3.2'#展示svg图标控件
  intl: any#国际化工具类
  connectivity: '0.3.1'#链接网络
  flutter_staggered_grid_view:#瀑布流展示控件
  flutter_file_manager:#文件管理
  loader_search_bar:#导航栏搜索控件
  flutter_image_compress : any#图片压缩
  ota_update : any#App下载更新
  flutter_slidable：#item侧滑控件
 */
class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool _switchvalue = false;
  // bool _ischecked = false;
  String _loginValue = 'login';

  PageController _controller;
  PageView _pageView;

  int _currentPage = 0;
  SharedPreferences pres;

  @override
  void initState() {
    super.initState();
    _controller = PageController();

    // _nameController.text = SpUtil.getString('phone');

    _pageView = PageView(
      controller: _controller,
      children: <Widget>[
        SignInPage(),
        SignUpPage(),
      ],
      onPageChanged: (index) {
        setState(() => _currentPage = index);
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildIndicator() {
    return Container(
      width: 300.0,
      height: 42.0,
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
      decoration: BoxDecoration(
        color: Colors.white,

        /// 圆角
        borderRadius: BorderRadius.all(
          Radius.circular(21.0),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Button(
              // onPressed: () {},
              onPressed: () => _controller.animateToPage(0,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.decelerate),
              child: Text('登录', style: TextStyle(fontSize: 16)),
              buttonShape: ButtonShape.Fillet,
              borderRadius: 30.0,

              textColor: _currentPage == 0 ? Colors.white : Colors.black54,
              height: 35.0,
              color: _currentPage == 0 ? Colors.blue : Colors.transparent,
            ),
          ),
          Expanded(
            child: Button(
              onPressed: () => _controller.animateToPage(1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.decelerate),
              child: Text('注册', style: TextStyle(fontSize: 16)),
              buttonShape: ButtonShape.Fillet,
              borderRadius: 30.0,
              height: 35.0,
              textColor: _currentPage == 1 ? Colors.white : Colors.black54,
              color: _currentPage == 1 ? Colors.blue : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("登录"),
      ),
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        GradualChangeView(
          colors: [Color(0xFFfbab66), Color(0xFFf7418c)],
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        SingleChildScrollView(
            child: Container(
                // color: Color.fromRGBO(245, 245, 245, 1),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          /// 上面图片
                          // Hero(
                          //     tag: 'login_logo',
                          //     child: Image.asset(
                          //       'assets/images/system_person_bg@2x.png',
                          //       height: 160,
                          //       width: ScreenUtils.screenW(context),
                          //       fit: BoxFit.fitWidth,
                          //     )),

                          SizedBox(
                            height: 40,
                          ),

                          /// 指示器
                          _buildIndicator(),

                          /// PageView
                          Expanded(child: _pageView)
                        ]))))
      ]),
    );
  }
}

void testBool() {
  Future<bool> result = SharedPreferenceUtil.setBool("key", false);
  result.then((value) {
    print("is setBool success=$value");
  });

  Future<bool> result2 = SharedPreferenceUtil.getBool("key");
  result2.then((value) {
    print("getBoolResult=$value");
  });
}
