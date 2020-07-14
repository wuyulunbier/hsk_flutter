import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Container(
        child: buildTextView(),
      ),
    );
  }

  Widget buildTextView() {
    return Column(
      children: <Widget>[
        Text(
          "欢迎使用聚马车队",
        ),
        TextField(
          decoration: InputDecoration(
              fillColor: Colors.blue.shade100, filled: true, hintText: '输入手机号'),
        ),
        TextField(
          decoration: InputDecoration(
              fillColor: Colors.blue.shade100, filled: true, hintText: '输入密码'),
        ),
        RaisedButton(
          onPressed: _login,
          color: Colors.green,
          child: Text("登录"),
          textColor: Colors.white,
          elevation: 10,
        ),
      ],
    );
  }

  _login() {
    //log('press button');
    print('button pressed');
  }
}
