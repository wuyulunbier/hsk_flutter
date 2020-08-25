import 'package:flutter/material.dart';
import 'package:hsk_flutter/routers/LoginRouter.dart';

import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';
import 'package:hsk_flutter/widgets/click_item.dart';
import "package:hsk_flutter/util/screen_utils.dart";
import 'package:hsk_flutter/provider/LoginModel.dart';
import 'package:provider/provider.dart';
import 'package:hsk_flutter/widgets/Exit_dialog.dart';

class PersonCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showExitDialog() {
      showDialog<void>(context: context, builder: (_) => const ExitDialog());
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
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(40, 100, 0, 0),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  print('点击头像');
                                },
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  child: CircleAvatar(
                                      backgroundImage: new NetworkImage(
                                    '${context.watch<LoginModel>().headUrl}',
                                  )),
                                )
                                // child: Image.network(
                                //   '${context.watch<LoginModel>().headUrl}',
                                //   width: 60.0,
                                //   height: 60.0,
                                //   fit: BoxFit.fill,
                                // )
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
}
