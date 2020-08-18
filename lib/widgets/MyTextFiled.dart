import 'package:flutter/material.dart';

/// 登录模块的输入框封装
class MyTextField extends StatefulWidget {
  const MyTextField(
      {Key key,
      @required this.controller,
      this.maxLength = 16,
      this.autoFocus = false,
      this.keyboardType = TextInputType.text,
      this.hintText = '',
      this.focusNode,
      this.isInputPwd = false,
      this.getVCode,
      this.keyName})
      : super(key: key);

  final TextEditingController controller;
  final int maxLength;
  final bool autoFocus;
  final TextInputType keyboardType;
  final String hintText;
  final FocusNode focusNode;
  final bool isInputPwd;
  final Future<bool> Function() getVCode;

  /// 用于集成测试寻找widget
  final String keyName;

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  // bool _isShowPwd = false;
  // bool _isShowDelete = false;
  // bool _clickable = true;
  // /// 倒计时秒数
  // final int _second = 30;
  // /// 当前秒数
  // int _currentSecond;
  // //StreamSubscription _subscription;

  // @override
  // void initState() {
  //   /// 获取初始化值
  //   _isShowDelete = widget.controller.text.isEmpty;
  //   /// 监听输入改变
  //   widget.controller.addListener(isEmpty);
  //   super.initState();
  // }

  // void isEmpty() {
  //   bool isEmpty = widget.controller.text.isEmpty;
  //   /// 状态不一样在刷新，避免重复不必要的setState
  //   if (isEmpty != _isShowDelete) {
  //     setState(() {
  //       _isShowDelete = isEmpty;
  //     });
  //   }
  // }

  // @override
  // void dispose() {
  //  // _subscription?.cancel();
  //   widget.controller?.removeListener(isEmpty);
  //   super.dispose();
  // }

  // Future _getVCode() async {
  //   bool isSuccess = await widget.getVCode();
  //   if (isSuccess != null && isSuccess) {
  //     setState(() {
  //       _currentSecond = _second;
  //       _clickable = false;
  //     });
  //     //_subscription = Stream.periodic(const Duration(seconds: 1), (int i) => i).take(_second).listen((int i) {
  //       setState(() {
  //         _currentSecond = _second - i - 1;
  //         _clickable = _currentSecond < 1;
  //       });
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final bool isDark = themeData.brightness == Brightness.dark;

    final TextField textField = TextField(
      focusNode: widget.focusNode,
      maxLength: widget.maxLength,
      obscureText: widget.isInputPwd,
      autofocus: widget.autoFocus,
      controller: widget.controller,
      textInputAction: TextInputAction.done,
      keyboardType: widget.keyboardType,
    );
  }
}
