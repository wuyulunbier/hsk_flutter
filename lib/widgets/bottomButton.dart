import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    Key key,
    //@required this.child,
    @required this.onPressed,
    @required this.textLab,
    this.borderRadius: 5.0,
    this.color,
    this.height: 42.0,
    this.textColor,
    this.disabledColor,
    this.highlightColor,
    this.disabledTextColor,
    this.width: double.infinity,
    this.disabledBorderColor,
    this.highlightedBorderColor,
    this.borderWidth: 1.0,
  }) : super(key: key);

  //final Widget child;
  /// 圆角半径
  final double borderRadius;
  final Function onPressed;

  ///文字
  final String textLab;

  /// 按钮文字颜色
  final Color textColor;
  final Color disabledTextColor;

  /// 按钮背景色
  final Color color;
  final Color disabledColor;
  final Color highlightColor;

  final double width;
  final double height;

  final Color disabledBorderColor;
  final Color highlightedBorderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(0, 184, 184, 1),
            ),
            width: width,
            height: height,
            child: Text(
              textLab,
              style: TextStyle(
                color: Colors.white, //字体颜色
                fontSize: 16.0, //字体大小，注意flutter里面是double类型
                fontWeight: FontWeight.bold, //字体粗细

                letterSpacing: 5.0,
                wordSpacing: 30.0, //词间距
              ),
            ),
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
