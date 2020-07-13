import 'package:flutter/material.dart';

import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/constant/constant.dart';
import 'package:hsk_flutter/util/app_navigator.dart';
import 'package:fluro/fluro.dart';

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
            //onTap: () => NavigatorUtils.push(context, SettingRouter.accountManagerPage)
          ),
          ClickItem(
            title: '清除缓存',
            content: '23.5MB',
            // onTap: () {}
          ),
          ClickItem(
            title: '检查更新',
            // onTap: () => _showUpdateDialog()
          ),
          ClickItem(
            title: '关于我们',
            // onTap: () => NavigatorUtils.push(context, SettingRouter.aboutPage)
          ),
          ClickItem(
            title: '退出当前账号',
            // onTap: () => _showExitDialog(),
          ),
        ],
      ),
    );
  }
}
