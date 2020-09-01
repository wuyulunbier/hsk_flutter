import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hsk_flutter/public.dart';
import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';
import "package:hsk_flutter/util/screen_utils.dart";
import 'package:hsk_flutter/JSON/personModel.dart';

import 'package:hsk_flutter/JSON/loginInfoModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:hsk_flutter/provider/LoginModel.dart';

class SignInPage extends StatefulWidget {
  @override
  createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isShowPassWord = false;
  bool isShowLoading = false;

  bool _ischecked = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();

  /// 利用FocusNode和FocusScopeNode来控制焦点,
  ///
  /// 可以通过FocusNode.of(context)来获取widget树中默认的FocusScopeNode
  FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _nameController.text = SpUtil.getString('phone');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.lightGreen,
      padding: const EdgeInsets.only(top: 23),
      child: Container(
          child: GestureDetector(
        onTap: () {
          // 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: <Widget>[
            _buildEmailInput(),
            Container(
              width: 280.0,
              height: 1.0,
              color: Colors.grey[300],
              padding: const EdgeInsets.only(left: 0.0),
            ),
            _buildPasswordInput(),
            Container(
              width: 280.0,
              height: 1.0,
              color: Colors.grey[300],
              padding: const EdgeInsets.only(top: 0.0),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: GestureDetector(
                onTap: () => _login(),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  width: 300,
                  height: 45,
                  child: Text(
                    '登录',
                    style: TextStyle(
                      color: Colors.white, //字体颜色
                      fontSize: 16.0, //字体大小，注意flutter里面是double类型
                      fontWeight: FontWeight.bold, //字体粗细
                      //fontStyle: FontStyle.italic, // 斜体显示
                      letterSpacing: 5.0, //字体间距
                      wordSpacing: 30.0, //词间距
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Checkbox(
                      value: _ischecked,
                      activeColor: Colors.blue,
                      onChanged: (bool) {
                        setState(() {
                          _ischecked = bool;
                        });
                      }),
                ),
                RichText(
                    text: TextSpan(
                        text: '已阅读并同意服务协议',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                        children: <TextSpan>[
                      TextSpan(
                          text: '服务协议',
                          style:
                              TextStyle(color: Color(0xFF008EFF), fontSize: 13),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              NavigatorUtils.goWebViewPage(
                                  context, '服务协议', 'https://www.baidu.com/');
                            }),
                      TextSpan(
                        text: '和',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      TextSpan(
                          text: '隐私协议',
                          style:
                              TextStyle(color: Color(0xFF008EFF), fontSize: 13),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              NavigatorUtils.goWebViewPage(
                                  context, '隐私协议', 'https://www.baidu.com/');
                            }),
                    ])),
              ],
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildEmailInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
      child: TextFormField(
        controller: _nameController,
        maxLines: 1,

        /// 输入类型
        keyboardType: TextInputType.emailAddress,

        /// 是否自动更正
        autocorrect: false,

        /// 是否自动获得焦点
        autofocus: false,

        /// 是否禁用textfield:如果为false, textfield将被“禁用”
        enabled: true,

        /// 键盘动作按钮点击之后执行的代码： 光标切换到指定的输入框
        onEditingComplete: () =>
            FocusScope.of(context).requestFocus(passwordFocusNode),
        decoration: InputDecoration(
          icon: Icon(Icons.email, color: Colors.blue),
          hintText: "请输入手机号",
          border: InputBorder.none,
        ),

        /// 文本样式
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  Widget _buildPasswordInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: TextFormField(
        controller: _passwordController,
        keyboardType: TextInputType.text,

        /// 关联焦点
        focusNode: passwordFocusNode,

        /// 装饰器
        decoration: InputDecoration(
          icon: Icon(Icons.lock, color: Colors.blue),
          hintText: "请输入密码",
          border: InputBorder.none,
          // suffixIcon: IconButton(
          //   color: Theme.of(context).primaryColor,
          //   // icon: Icon(
          //   //     isShowPassWord
          //   //         ? CustomIcon.show_password
          //   //         : CustomIcon.hidden_password,
          //   //     color: Colors.black),
          //   onPressed: () => showPassword(),
          // ),
        ),

        /// 控制键盘的功能键 指enter键，比如此处设置为next时，enter键显示的文字内容为 下一步
        textInputAction: TextInputAction.done,

        /// 最大行数
        maxLines: 1,

        /// 是否需要用******显示
        obscureText: !isShowPassWord,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
    );
  }

  void showPassword() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }

  Future<void> _login() async {
    //log('press button');
    ///tosi的基本使用
    ///api的基本调用
    ///share_preference 本地存储的使用
    ///

    SpUtil.putString('phone', _nameController.text);

    // SharedPreferences pres1 = await SharedPreferences.getInstance();

    // pres1.setString('userName', 'wuyulunbier66667777');
    // pres1.setString('phone', '13866850026');

    // SharedPreferenceUtil.setBool("islogin", true);
    //数据存储和状态通知

    if (_nameController.text.length == 0) {
      Fluttertoast.showToast(msg: '请输入正确手机号', gravity: ToastGravity.CENTER);
      return;
    }

    if (_passwordController.text.length == 0) {
      Fluttertoast.showToast(msg: '请输入正确密码', gravity: ToastGravity.CENTER);
      return;
    }

    if (!_ischecked) {
      Fluttertoast.showToast(msg: '请阅读并勾选隐私协议', gravity: ToastGravity.CENTER);
      return;
    }

    // FormData params = FormData.fromMap({
    //   'Umengid': 'ios',
    //   'tel': _nameController.text,
    //   'pwd': _passwordController.text
    // });
    var param = {
      'Umengid': 'ios',
      'tel': _nameController.text,
      'pwd': _passwordController.text
    };

    // NavigatorUtils.push(context, CenterRouter.mainContainPage,
    //    clearStack: true);

    print(param);
    print('99999');

    RequestManager.getInstance()
        .get('http://apiwl3.atjubo.com/atapiwuliu/CarLogin', param, (data) {
      print(data);
      NavigatorUtils.push(context, CenterRouter.mainContainPage,
          clearStack: true);
      loginInfo info = loginInfo.fromJson(data['ReObj']);

      print(info.DriverName);
      print(info.DriverName);

      SpUtil.putBool('islogin', true);
      SpUtil.putString('userName', info.DriverName);
      SpUtil.putString('telphone', info.DriverTel);
      SpUtil.putString('HeadPic', info.HeadPic);

      // pres1.setBool('islogin', true);
      // pres1.setString('userName', info.DriverName);
      // pres1.setString('phone', info.DriverTel);
      // pres1.setString('HeadPic', info.HeadPic);

      context.read<LoginModel>().loginSuccess();

      Fluttertoast.showToast(
          msg: '登录成功' + info.DriverName,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.blue);
    }, (error) {
      print('错误');

      Fluttertoast.showToast(msg: '账号或者密码错误', gravity: ToastGravity.CENTER);
    });
  }
}
