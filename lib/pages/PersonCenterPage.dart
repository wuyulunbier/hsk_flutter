import 'package:flutter/material.dart';
import 'package:hsk_flutter/routers/LoginRouter.dart';

import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';
import 'package:hsk_flutter/widgets/click_item.dart';

class PersonCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('个人中心'),
        // backgroundColor: Colors.white,
        actions: <Widget>[
          FlatButton(
            child: Text(
              "设置",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              NavigatorUtils.push(context, CenterRouter.personsetPage);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
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
