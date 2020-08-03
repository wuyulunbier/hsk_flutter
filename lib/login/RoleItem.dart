/**
 * 
 * 相当于cell
 */
import 'package:flutter/material.dart';
import 'package:hsk_flutter/res/resources.dart';

class RoleItem extends StatelessWidget {
  const RoleItem(
      {Key key,
      this.onTap,
      @required this.title,
      @required this.imgUrl,
      this.content = '',
      this.textAlign = TextAlign.start,
      this.maxLines = 1})
      : super(key: key);

  final GestureTapCallback onTap;
  final String title;
  final String imgUrl;
  final String content;
  final TextAlign textAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
/**
 *  采用先申明控件 在返回页面
 */

    Widget child = Column(
      children: <Widget>[
        Container(
          width: 400,
          height: 250,
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: IconButton(
            icon: Image.asset(
              imgUrl,
              height: 150,
              width: 150,
              //  color: Colours.red,
              fit: BoxFit.cover,
            ),
            onPressed: onTap,
          ),
        ),
        Container(
          height: 20,
          width: 400,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          color: Colors.white,
          child: Text(title),
          alignment: Alignment.center,
        )
      ],
    );
    return InkWell(
      //InkWell组件在用户点击时出现“水波纹”效果
      onTap: onTap,
      child: child,
    );
  }
}
