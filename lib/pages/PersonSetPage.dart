import 'package:flutter/material.dart';
import 'package:hsk_flutter/login/LoginPage.dart';

import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:flutter/material.dart';

import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';
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
                  NavigatorUtils.push(context, CenterRouter.orderDetailPage)),
          ClickItem(
              title: '修改密码',
              content: '',
              onTap: () =>
                  NavigatorUtils.push(context, CenterRouter.orderDetailPage)),
          ClickItem(
              title: '推送设置',
              onTap: () =>
                  NavigatorUtils.push(context, CenterRouter.orderDetailPage)),
        ],
        bottomButton: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: MyButton(
              key: const Key('login'),
              onPressed: () => _showExitDialog(),
              // onPressed: () => NavigatorUtils.goBackWithParams(context, 'add'),
              // onPressed: () => {
              //       print('退出登录'),
              //       //NavigatorUtils.goBackWithParams(context, 'add'), f返回上一层
              //       //NavigatorUtils.push(context, CenterRouter.loginPage),
              //       Navigator.of(context).push(MaterialPageRoute(
              //           fullscreenDialog: true,
              //           builder: (context) => LoginPage())),
              //       Fluttertoast.showToast(
              //           msg: '登出成功', gravity: ToastGravity.CENTER),
              //     },
              text: '退出登录'),
        ),
      ),
    );
  }

  void _showExitDialog() {
    showDialog<void>(context: context, builder: (_) => const ExitDialog());
  }
}
