import 'package:flutter/material.dart';
import 'package:hsk_flutter/routers/LoginRouter.dart';

import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';
import 'package:hsk_flutter/widgets/click_item.dart';
import "package:hsk_flutter/util/screen_utils.dart";
import 'package:hsk_flutter/provider/LoginModel.dart';
import 'package:provider/provider.dart';

class PersonCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('个人中心'),
      //   // backgroundColor: Colors.white,
      //   actions: <Widget>[
      //     FlatButton(
      //       child: Text(
      //         "设置",
      //         style: TextStyle(color: Colors.white),
      //       ),
      //       onPressed: () {
      //         NavigatorUtils.push(context, CenterRouter.personsetPage);
      //       },
      //     )
      //   ],
      // ),
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
                      // height: ScreenUtils.screenH(context),
                      width: ScreenUtils.screenW(context),
                      fit: BoxFit.fill,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(40, 100, 0, 0),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                print('点击头像');
                              },
                              child: Image.asset(
                                'assets/images/Choose-carriers@2x.png',
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 15, top: 0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      '${context.watch<LoginModel>().name}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        '${context.watch<LoginModel>().phone}',
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        )),

                    // Container(child: Text('wuyulunbier'),padding: edgr,)
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
              content: '23.5MB',
              onTap: () => NavigatorUtils.push(context, LoginRouter.loginPage)),
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
            padding: EdgeInsets.all(10),
            child: Card(
              color: Colors.teal,
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
            ),
          )
        ],
      ),
    );
  }
}
