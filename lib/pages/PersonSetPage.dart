import 'package:flutter/material.dart';
import 'package:hsk_flutter/login/LoginPage.dart';
import 'package:hsk_flutter/routers/LoginRouter.dart';

import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:flutter/material.dart';

import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/widgets/MyButton.dart';
import 'package:hsk_flutter/widgets/click_item.dart';

import 'package:hsk_flutter/widgets/my_scroll_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hsk_flutter/widgets/Exit_dialog.dart';

class PersonSetPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<PersonSetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: const FlexibleSpaceBar(
          title: const Text('设置'),
        ),
      ),
      body: MyScrollView(
        children: [
          ClickItem(
              title: '更换手机号码',
              onTap: () =>
                  NavigatorUtils.push(context, LoginRouter.changePage)),
          ClickItem(
              title: '修改密码',
              content: '',
              onTap: () =>
                  NavigatorUtils.push(context, LoginRouter.updatePwdPage)),
          ClickItem(
              title: '推送设置',
              onTap: () =>
                  NavigatorUtils.push(context, LoginRouter.notifyPage)),
        ],
        bottomButton: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: MyButton(
              key: const Key('login'),
              onPressed: () => _showExitDialog(),
              text: '退出登录'),
        ),
      ),
    );
  }

  void _showExitDialog() {
    showDialog<void>(context: context, builder: (_) => const ExitDialog());
  }
}
