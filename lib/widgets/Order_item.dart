/**
 * 
 * 相当于cell
 */
import 'package:flutter/material.dart';
import 'package:hsk_flutter/res/resources.dart';
import 'package:hsk_flutter/JSON/userOrderModel.dart';
import 'package:hsk_flutter/res/gaps.dart';
import 'package:hsk_flutter/res/dimens.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(
      {Key key,
      this.onTap,
      this.onSelectAction,
      this.onCancelAction,
      @required this.index,
      @required this.model,
      this.textAlign = TextAlign.start,
      this.maxLines = 1})
      : super(key: key);

  final GestureTapCallback onTap;
  final GestureTapCallback onSelectAction;
  final GestureTapCallback onCancelAction;

  final int index;
  final UserOrderModel model;
  final TextAlign textAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
/**
 *  采用先申明控件 在返回页面
 */
    var item = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Gaps.hGap16,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Gaps.vGap32,
              Text('${model.FromAddr}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle2),
              Gaps.vGap4,
              Text('${model.ToAddr}',
                  style: Theme.of(context).textTheme.subtitle2),
              Gaps.vGap16,
              Row(
                children: <Widget>[
                  Text('订单编号:'),
                  Text(
                    '${model.OrderID}',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
              Gaps.vGap16,
              Row(
                children: <Widget>[
                  Text('货物信息:'),
                  Text(
                    '${model.HwName}/' +
                        '${model.HwWeight}/吨' +
                        '${model.HwQuantity}件',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
              Gaps.vGap16,
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: FlatButton(
                      child: const Text(
                        '拒单',
                        style: TextStyle(fontSize: Dimens.font_sp18),
                      ),
                      onPressed: onCancelAction,
                    ),
                  ),
                  Gaps.hGap16,
                  Expanded(
                    flex: 1,
                    child: FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: const Text(
                        '接单',
                        style: TextStyle(fontSize: Dimens.font_sp18),
                      ),
                      onPressed: onSelectAction,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        // Text(Utils.formatPrice('25'), style: TextStyles.textBold14),
      ],
    );

    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border(
        bottom: Divider.createBorderSide(context, width: 0.8),
      )),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: InkWell(
            onTap: onTap,
            child: item,
          )),
    );
  }
}
