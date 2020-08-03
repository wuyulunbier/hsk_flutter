import 'package:flutter/material.dart';

import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';
import 'package:hsk_flutter/widgets/click_item.dart';
import 'package:hsk_flutter/widgets/app_bar.dart';

class PersonCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        //key: _hintKey,
        title: '个人中心',
        actionName: '设置',

        backgroundColor: Colors.blue,
        onPressed: () {
          NavigatorUtils.push(context, CenterRouter.personsetPage);
        },
      ),
      body: Column(
        children: <Widget>[
          ClickItem(
              title: '账号管理',
              onTap: () =>
                  NavigatorUtils.push(context, CenterRouter.orderDetailPage)),
          ClickItem(
              title: '清除缓存',
              content: '23.5MB',
              onTap: () =>
                  NavigatorUtils.push(context, CenterRouter.orderDetailPage)),
          ClickItem(
              title: '检查更新',
              onTap: () =>
                  NavigatorUtils.push(context, CenterRouter.orderDetailPage)),
          ClickItem(
              title: '关于我们',
              onTap: () => NavigatorUtils.goWebViewPage(
                  context, '聚马车队', 'https://www.baidu.com/')),
          ClickItem(
              title: '退出当前账号',
              onTap: () => NavigatorUtils.goWebViewPage(
                  context, 'Flutter', 'https://flutter.cn')),
        ],
      ),
    );
  }
}
