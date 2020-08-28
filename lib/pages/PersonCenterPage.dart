import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hsk_flutter/routers/LoginRouter.dart';

import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';
import 'package:hsk_flutter/util/SpUtil.dart';
import 'package:hsk_flutter/widgets/click_item.dart';
import "package:hsk_flutter/util/screen_utils.dart";
import 'package:hsk_flutter/provider/LoginModel.dart';
import 'package:provider/provider.dart';
import 'package:hsk_flutter/widgets/Exit_dialog.dart';

import 'package:hsk_flutter/util/Utils.dart';
import 'package:hsk_flutter/widgets/Base_action_dialog.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PersonCenterPage extends StatefulWidget {
  @override
  PersonCenterPageState createState() => PersonCenterPageState();
}

class PersonCenterPageState extends State<PersonCenterPage> {
  bool islogin = false;
  String userName;
  String telPhone;
  String headPic;

  String cacheData;

  File _imageFile;
  File _imageFile1;

  final ImagePicker picker = ImagePicker();

  Future _getImage(ImageSource source, int type) async {
    print('666');
    try {
      PickedFile pickedFile =
          await picker.getImage(source: source, maxWidth: 800);
      setState(() {
        if (type == 0) {
          _imageFile = File(pickedFile.path);
        } else {
          _imageFile = File(pickedFile.path);
          // _imageFile1 = File(pickedFile.path);
        }

        // _imageFile = File(pickedFile.path);
      });
    } catch (e) {
      print(e);
      print('999');
      Fluttertoast.showToast(msg: '没有权限，无法打开相册！', gravity: ToastGravity.CENTER);
      //Toast.show('没有权限，无法打开相册！');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(Utils().loadCache());

    Utils().loadCache().then((value) => {
          print(value),
          cacheData = Utils().formatSize(value),
          print('3333'),
          print(value),
          print('555'),
        });
    //cacheData = value;

    print(cacheData);
    print('pppp');

    islogin = SpUtil.getBool('islogin');
    userName = SpUtil.getString('userName');
    telPhone = SpUtil.getString('telphone');
    headPic = SpUtil.getString('HeadPic');
  }

  @override
  Widget build(BuildContext context) {
    void _showExitDialog() {
      showDialog<void>(context: context, builder: (_) => const ExitDialog());
    }

    void _showCleanCacheDialog() {
      showDialog<void>(
          context: context,
          builder: (_) => BaseActionDialog(
                title: '温馨提示',
                content: '是否确定清除缓存',
                onPressed: () {
                  cacheData = '0kb';
                  // Utils().clearApplicationCache();
                  setState(() {});
                  NavigatorUtils.goBack(context);
                },
              ));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            child: Container(
                child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/system_person_bg@2x.png',
                      width: ScreenUtils.screenW(context),
                      fit: BoxFit.fill,
                      height: 250,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(40, 100, 0, 0),
                        child: Row(
                          children: <Widget>[
                            //'${context.watch<LoginModel>().headUrl}'
                            GestureDetector(
                                onTap: () {
                                  _showSelectionDialog(context);
                                },
                                child: Container(
                                    width: 60,
                                    height: 60,
                                    child: CircleAvatar(
                                      backgroundImage: new NetworkImage(
                                        headPic,
                                      ),
                                    ))),

                            SizedBox(
                              width: 15,
                            ),

                            Expanded(
                                flex: 4,
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      userName,
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      telPhone,
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '自由自驱，价值为先，简单真诚，团队第一,追求卓越',
                                      maxLines: 2,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.red),
                                    )
                                  ],
                                ))
                            //),
                          ],
                        )),
                  ],
                )
              ],
            )),
            height: 250,
          ),
          ClickItem(
              title: '账号管理',
              onTap: () => NavigatorUtils.push(context, LoginRouter.loginPage)),
          ClickItem(
              title: '清除缓存',
              content: '${cacheData}',
              onTap: () {
                _showCleanCacheDialog();

                print('获取app缓存: ');

                // print(Utils.loadCache());

                print(Utils().loadCache());
              }),
          ClickItem(
              title: '检查更新',
              onTap: () => NavigatorUtils.goWebViewPage(
                  context, 'Flutter', 'https://flutter.cn')),
          ClickItem(
              title: '关于我们',
              onTap: () => NavigatorUtils.goWebViewPage(
                  context, '聚马车队', 'https://www.baidu.com/')),
          ClickItem(
              title: '个人设置',
              onTap: () =>
                  NavigatorUtils.push(context, CenterRouter.personsetPage)),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Card(
                color: Colors.teal,
                child: GestureDetector(
                  onTap: () => _showExitDialog(),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '退出登录',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }

  void _showSelectionDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      builder: (ctx) {
        return Container(
          color: Colors.grey,
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: _itemCreat(context, '相机'),
                onTap: () {
                  print('选中相机');
                  Navigator.pop(context);
                  _getImage(ImageSource.camera, 0);
                  //getImage(ImageSource.camera,type);
                },
              ),
              GestureDetector(
                child: _itemCreat(context, '相册'),
                onTap: () {
                  print('选中相册');
                  Navigator.pop(context);
                  _getImage(ImageSource.gallery, 1);
                },
              ),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: _itemCreat(context, '取消'),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  Widget _itemCreat(BuildContext context, String title) {
    return Container(
      color: Colors.white,
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
