import 'package:flutter/material.dart';
import 'package:hsk_flutter/widgets/my_scroll_view.dart';
import 'package:hsk_flutter/res/gaps.dart';
import 'package:hsk_flutter/res/dimens.dart';
//import "package:hsk_flutter/util/screen_utils.dart";

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({Key key, this.orderId}) : super(key: key);

  final String orderId;

  @override
  _orderInfoPageState createState() => _orderInfoPageState();
}

/**
 * http://apiwl3.atjubo.com/ServiceInterface/JuMaWuLiu/WuLiuOrder.asmx/getIntegrationOrderDetailsByCar
 * {
	"id": 28852,
	"type": 1,
	"carid": 808
}
 */

class _orderInfoPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      ListView.builder(
        // 如果滚动视图在滚动方向无界约束，那么shrinkWrap必须为true
        shrinkWrap: true,
        // 禁用ListView滑动，使用外层的ScrollView滑动
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (_, index) => _getOrderGoodsItem(index),
      ),
    ];

    print('999');
    print(widget.orderId);
    print('888');
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            '订单详情',
          ),
        ),
        body: MyScrollView(
          key: const Key('order_info'),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: children,
          // bottomButton: bottomMenu,
        ));
  }

  Widget _getOrderGoodsItem(int index) {
    var item = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(widget.orderId),
          margin: const EdgeInsets.only(top: 5.0),
        ),
        Gaps.hGap8,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                index % 2 == 0 ? '泊泉雅花瓣·浪漫亲肤玫瑰沐浴乳' : '日本纳鲁火多橙饮',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Gaps.vGap4,
              Text(index % 2 == 0 ? '玫瑰香 520ml' : '125ml',
                  style: Theme.of(context).textTheme.subtitle2),
              Gaps.vGap8,
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).errorColor,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    height: 16.0,
                    alignment: Alignment.center,
                    child: Text(
                      '立减2.50元',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: Dimens.font_sp10,
                      ),
                    ),
                  ),
                  Gaps.hGap4,
                  Offstage(
                    offstage: index % 2 != 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      height: 16.0,
                      alignment: Alignment.center,
                      child: const Text(
                        '抵扣2.50元',
                        style: TextStyle(
                            color: Colors.white, fontSize: Dimens.font_sp10),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Gaps.hGap8,
        Text(
          'x1',
        ),
        Gaps.hGap32,
        // Text(Utils.formatPrice('25'), style: TextStyles.textBold14),
      ],
    );

    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border(
        bottom: Divider.createBorderSide(context, width: 0.8),
      )),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0), child: item),
    );
  }

  void _showCallPhoneDialog(String phone) {
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('提示'),
            content: Text('是否拨打：$phone ?'),
            actions: <Widget>[
              // FlatButton(
              //   // onPressed: () => NavigatorUtils.goBack(context),
              //   child: const Text('取消'),
              // ),
              FlatButton(
                onPressed: () {
                  // Utils.launchTelURL(phone);
                  // NavigatorUtils.goBack(context);
                },
                textColor: Theme.of(context).errorColor,
                child: const Text('拨打'),
              ),
            ],
          );
        });
  }
}
