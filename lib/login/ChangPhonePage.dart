import 'package:flutter/material.dart';
import 'package:hsk_flutter/widgets/my_scroll_view.dart';

import 'package:hsk_flutter/widgets/my_scroll_view.dart';
import 'package:hsk_flutter/widgets/MyButton.dart';
import 'package:hsk_flutter/res/gaps.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChangePhonePage extends StatefulWidget {
  @override
  _ChangePhonePageState createState() => _ChangePhonePageState();
}

class _ChangePhonePageState extends State<ChangePhonePage> {
  //定义一个controller
  final TextEditingController _oldPwdController = TextEditingController();
  final TextEditingController _newPwdController = TextEditingController();
  final TextEditingController _againPwdController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  bool _clickable = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("更换手机号"),
      ),
      body: MyScrollView(
          // keyboardConfig: Utils.getKeyboardActionsConfig(context, <FocusNode>[_nodeText1, _nodeText2]),
          crossAxisAlignment: CrossAxisAlignment.center,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
          children: <Widget>[
            const Text(
              '更换手机号',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Gaps.vGap8,
            TextField(
              //isInputPwd: true,
              focusNode: _nodeText1,
              controller: _oldPwdController,
              // maxLength: 16,
              decoration: InputDecoration(hintText: '输入原密码'),
              keyboardType: TextInputType.visiblePassword,
              // hintText: '请确认旧密码',
            ),
            Gaps.vGap24,
            TextField(
              // isInputPwd: true,
              focusNode: _nodeText2,
              controller: _newPwdController,
              // maxLength: 16,
              decoration: InputDecoration(hintText: '请输入新手机号'),
              keyboardType: TextInputType.visiblePassword,
              //  hintText: '请输入新密码',
            ),
            Gaps.vGap24,
            TextField(
              // isInputPwd: true,
              focusNode: _nodeText3,
              controller: _againPwdController,
              // maxLength: 16,
              decoration: InputDecoration(hintText: '请输入验证码'),
              keyboardType: TextInputType.visiblePassword,
              //  hintText: '请输入新密码',
            ),
            Gaps.vGap50,
            MyButton(
              onPressed: _confirm,
              text: '确认',
            )
          ]),
    );
  }

  void _confirm() {
    print('修改密码成功');

    final String oldPwd = _oldPwdController.text;
    final String newPwd = _newPwdController.text;
    final String againPwd = _againPwdController.text;

    if (oldPwd.length == 0) {
      Fluttertoast.showToast(msg: '请输入原密码', gravity: ToastGravity.CENTER);
      return;
    }

    if (newPwd.length == 0) {
      Fluttertoast.showToast(msg: '请输入正确手机号', gravity: ToastGravity.CENTER);
      return;
    }
    if (againPwd.length == 0) {
      Fluttertoast.showToast(msg: '请输入正确验证', gravity: ToastGravity.CENTER);

      return;
    }

    print('就密码' + oldPwd);

    print('新密码' + newPwd);

    print('确认密码' + againPwd);

    Fluttertoast.showToast(
        msg: '修改成功！',
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blue);

    Navigator.pop(context);

    // t.show('修改成功！');
    // NavigatorUtils.goBack(context);
  }
}
