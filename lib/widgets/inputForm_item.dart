import 'package:flutter/material.dart';

class InputItemForm extends StatelessWidget {
  InputItemForm({
    Key key,
    @required this.textLab,
    @required this.controller,
    @required this.node,
    @required this.imgPath,
  }) : super(key: key);
  //icon
  final String imgPath;

  ///文字
  final String textLab;
  final TextEditingController controller;
  final FocusNode node;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, right: 0.0, top: 10.0),
      child: TextFormField(
        controller: controller,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        autofocus: false,
        enabled: true,

        /// 键盘动作按钮点击之后执行的代码： 光标切换到指定的输入框
        onEditingComplete: () => FocusScope.of(context).requestFocus(node),
        decoration: InputDecoration(
          icon: Image.asset(
            imgPath,
            width: 24,
            height: 24,
          ),
          hintText: textLab,
          border: InputBorder.none,
        ),

        /// 文本样式
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }
}
