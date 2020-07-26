import 'package:flutter/material.dart';

import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';
import 'package:hsk_flutter/widgets/click_item.dart';

class PersonCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: const FlexibleSpaceBar(
          title: const Text('个人中心'),
        ),
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
