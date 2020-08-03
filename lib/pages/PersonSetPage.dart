import 'package:flutter/material.dart';

import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:flutter/material.dart';

import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';
import 'package:hsk_flutter/widgets/MyButton.dart';
import 'package:hsk_flutter/widgets/click_item.dart';

import 'package:hsk_flutter/widgets/my_scroll_view.dart';

class PersonSetPage extends StatelessWidget {
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
          child:
              MyButton(key: const Key('login'), onPressed: null, text: '退出登录'),
        ),
        // Column(
        // children:
        // <Widget>[
        //
        //   Padding(
        //     padding:
        //         const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0,),
        //     child: MyButton(
        //         key: const Key('login'), onPressed: null, text: '退出登录'),
        //   )
        // ],)
      ),
    );
  }
}
