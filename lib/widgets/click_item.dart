/**
 * 
 * 相当于cell
 */
import 'package:flutter/material.dart';
import 'package:hsk_flutter/res/resources.dart';
import 'package:hsk_flutter/res/gaps.dart';
import 'package:hsk_flutter/widgets/LoadImage.dart';

class ClickItem extends StatelessWidget {
  const ClickItem(
      {Key key,
      this.onTap,
      @required this.title,
      this.content = '',
      this.imgPath,
      this.textAlign = TextAlign.start,
      this.maxLines = 1})
      : super(key: key);

  final GestureTapCallback onTap;
  final String title;
  final String content;
  final String imgPath;
  final TextAlign textAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
/**
 *  采用先申明控件 在返回页面
 */

    Widget child = Row(
      //为了数字类文字居中
      crossAxisAlignment:
          maxLines == 1 ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: <Widget>[
        Offstage(
          offstage: imgPath == null,
          child: Container(
            child: LoadAssetImage(
              this.imgPath,
              width: 20,
              height: 20,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(title),
        const Spacer(),
        Gaps.hGap16,
        Expanded(
          flex: 4,
          child: Text(
            content,
            maxLines: maxLines,
            textAlign: maxLines == 1 ? TextAlign.right : textAlign,
            overflow: TextOverflow.ellipsis,
            // style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: Dimens.font_sp14),
          ),
        ),
        Gaps.hGap8,
        Opacity(
          // 无点击事件时，隐藏箭头图标
          opacity: onTap == null ? 0 : 1,
          child: Padding(
            padding: EdgeInsets.only(top: maxLines == 1 ? 0.0 : 2.0),
            child: Images.arrowRight,
          ),
        )
      ],
    );

    /// 分隔线
    child = Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10),
      padding: const EdgeInsets.fromLTRB(0, 15.0, 0.0, 15.0),
      constraints: const BoxConstraints(
        maxHeight: double.infinity,
        minHeight: 50.0,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context, width: 0.6),
        ),
      ),
      child: child,
    );

    return InkWell(
      //InkWell组件在用户点击时出现“水波纹”效果

      onTap: onTap,
      child: child,
    );
  }
}
