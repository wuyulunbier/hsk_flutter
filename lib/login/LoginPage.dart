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
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hsk_flutter/util/screen_utils.dart';

import 'package:hsk_flutter/app/RequestManager.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hsk_flutter/container_page.dart';
import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';
import 'package:hsk_flutter/res/SharedPreferenceUtil.dart';

import 'package:hsk_flutter/JSON/personModel.dart';
import 'dart:convert';
import 'package:hsk_flutter/res/mockData.dart';

import 'package:hsk_flutter/JSON/loginInfoModel.dart';
import 'package:hsk_flutter/res/mockInfo.dart';

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

class LoginPageState extends State<LoginPage> {
  bool _switchvalue = false;
  String _loginValue = 'login';
  SharedPreferences pres;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            // CupertinoSwitch(
            //   value: _switchvalue,
            //   onChanged: (value) {
            //     print("value = $value");

            //     setState(() {
            //       _switchvalue = value;
            //     });
            //   },
            // ),

            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: CupertinoSegmentedControl(
                  selectedColor: Colors.red,
                  unselectedColor: Colors.white,
                  // groupValue: _loginValue,
                  children: {
                    "login": Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text("登录"),
                    ),
                    "register": Text("注册"),
                  },
                  onValueChanged: (value) {
                    print(value + '66');
                    setState(() {
                      // 数据改变时通过setState改变选中状态
                      _loginValue = value;
                    });
                  }),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: TextField(
                key: const Key('phone'),
                focusNode: _nodeText1,
                controller: _nameController,
                ////Image.asset('assets/images/login_number@2x.png',
                decoration: InputDecoration(
                    // prefixIcon: new Icon(Icons.phone),
                    //  / fillColor: Colors.blue.shade100,
                    // filled: true,
                    hintText: '输入手机号'),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextField(
                key: const Key('password'),
                focusNode: _nodeText2,
                controller: _passwordController,
                obscureText: true, //是否是密码
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10.0),
                    //prefixIcon: new Icon(Icons.phone),
                    //fillColor: Colors.blue.shade100,
                    // filled: true,

                    hintText: '输入密码'),
              ),
            ),

            // RaisedButton(
            //   onPressed: _login,
            //   color: Colors.green,
            //   child: Text("登录"),
            //   textColor: Colors.white,
            //   elevation: 10,
            // ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: GestureDetector(
                onTap: () => _login(),
                // onTap: () => {
                //   NavigatorUtils.push(context, CenterRouter.mainContainPage,
                //       clearStack: true),
                //   // NavigatorUtils.push(context, CenterRouter.mainContainPage),

                //   // FormData params = FormData.fromMap(
                //   //     {'Umengid': 'ios', 'tel': '13866850026', 'pwd': '654321'});
                //   // RequestManager.getInstance()
                //   //     .get('http://apiwl3.atjubo.com/atapiwuliu/CarLogin', params, (data) {
                //   //   Fluttertoast.showToast(
                //   //       msg: data.toString(),
                //   //       gravity: ToastGravity.CENTER,
                //   //       backgroundColor: Colors.blue);

                //   Fluttertoast.showToast(
                //       msg: '登录成功',
                //       gravity: ToastGravity.CENTER,
                //       backgroundColor: Colors.blue),

                //   // }, (error) {});
                // },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  width: 300,
                  height: 45,
                  //color: Colors.red,//
                  child: Text(
                    '登录',
                    style: TextStyle(
                      color: Colors.white, //字体颜色
                      fontSize: 16.0, //字体大小，注意flutter里面是double类型
                      fontWeight: FontWeight.bold, //字体粗细
                      //fontStyle: FontStyle.italic, // 斜体显示
                      letterSpacing: 5.0, //字体间距
                      wordSpacing: 30.0, //词间距
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ),

            // SizedBox(
            //   width: 300,
            //   height: 50,
            //   child: RaisedButton(
            //     onPressed: () {},
            //     child: Text("宽度占满了"),
            //     color: Colors.green,
            //     textColor: Colors.white,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(10)),
            //         side: BorderSide(
            //             color: Color(0xFFF0F00),
            //             style: BorderStyle.solid,
            //             width: 2)),
            //     clipBehavior: Clip.antiAlias,
            //   ),
            // ),
            // RaisedButton(
            //   onPressed: _storeForm,
            //   color: Colors.green,
            //   child: Text("注册4"),
            //   textColor: Colors.white,
            //   elevation: 10,
            // ),
            // RaisedButton(
            //   child: new Text('箭头语法'),
            //   onPressed: () => {
            //     print("88888"),
            //   },
            // ),
            // FlatButton(
            //   onPressed: _register,
            //   child: Text("FlatButton66"),
            //   textColor: Colors.white,
            //   textTheme: ButtonTextTheme.normal,
            //   color: Color(0xFF82B1FF),
            // ),

            ///  HomeItem(),
          ],
        ),
      ),
    );
  }

  _login() async {
    //log('press button');
    ///tosi的基本使用
    ///api的基本调用
    ///
    ///
    ///
    ///share_preference 本地存储的使用
    SharedPreferences pres1 = await SharedPreferences.getInstance();

    SharedPreferenceUtil.setBool("islogin", true);
    //数据存储和状态通知

    if (_nameController.text.length == 0) {
      Fluttertoast.showToast(msg: '请输入正确手机号', gravity: ToastGravity.CENTER);
      return;
    }

    if (_passwordController.text.length == 0) {
      Fluttertoast.showToast(msg: '请输入正确密码', gravity: ToastGravity.CENTER);
      return;
    }
    // FormData params = FormData.fromMap({
    //   'Umengid': 'ios',
    //   'tel': _nameController.text,
    //   'pwd': _passwordController.text
    // });
    var param = {
      'Umengid': 'ios',
      'tel': _nameController.text,
      'pwd': _passwordController.text
    };

    print(param);
    print('99999');

    RequestManager.getInstance()
        .get('http://apiwl3.atjubo.com/atapiwuliu/CarLogin', param, (data) {
      print(data);
      NavigatorUtils.push(context, CenterRouter.mainContainPage,
          clearStack: true);
      loginInfo info = loginInfo.fromJson(data['ReObj']);

      print(info.DriverName);
      print(info.DriverName);

      pres1.setBool('islogin', true);
      pres1.setString('userName', _nameController.text);
      pres1.setString('pwd', _passwordController.text);

      Fluttertoast.showToast(
          msg: '登录成功' + info.DriverName,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.blue);
    }, (error) {
      print('错误');

      Fluttertoast.showToast(msg: '账号或者密码错误', gravity: ToastGravity.CENTER);
    });
  }
}

_add() async {
  SharedPreferences pres = await SharedPreferences.getInstance();

  var username = '';
  var pwd = '';

  pres.setBool('islogin', true);
  pres.setString('userName', username);
  pres.setString('pwd', pwd);
}

void _storeForm() async {
  SharedPreferences pres = await SharedPreferences.getInstance();

  bool login = pres.get('islogin');

  String name = pres.get('userName');
  String pwd = pres.get('pwd');

  Future<bool> result = SharedPreferenceUtil.getBool('islogin');
  result.then((value) {
    print("is setBool success=$value");
  });
  print('test is login');

  print(name + pwd + '8888');

  print(pres.get('islogin') + 666);
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

_register() {
  Map dataMap = json.decode(JsonString.mockdata);

  Data data1 = Data.fromJson(dataMap);

  Map infoMap = json.decode(LoginInfo.mockdata);
  loginInfo info = loginInfo.fromJson(infoMap);

  print(info.DriverName);

  print(data1.kids);

  print(info.CarHeight.toString() + "车高");

  Fluttertoast.showToast(
      msg: info.DriverName,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.blue);
}
