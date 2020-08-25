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
    Widget bottomMenu = Container(
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Theme(
        data: Theme.of(context).copyWith(
          buttonTheme: const ButtonThemeData(
            height: 44.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: FlatButton(
                //  color:
                //      isDark ? Colours.dark_material_bg : const Color(0xFFE1EAFA),
                //  textColor: isDark ? Colours.dark_text : Colours.app_main,
                child: const Text(
                  '拒单',
                  style: TextStyle(fontSize: Dimens.font_sp18),
                ),
                onPressed: () {},
              ),
            ),
            Gaps.hGap16,
            Expanded(
              flex: 1,
              child: FlatButton(
                //color: blue,
                // textColor: isDark ? Colours.dark_button_text : Colors.white,
                child: const Text(
                  '接单',
                  style: TextStyle(fontSize: Dimens.font_sp18),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );

    List<Widget> children = [
      Gaps.vGap24,
      const Text(
        '货物信息',
        style: TextStyle(
            fontSize: 17, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      // ListView.builder(
      //   // 如果滚动视图在滚动方向无界约束，那么shrinkWrap必须为true
      //   shrinkWrap: true,
      //   // 禁用ListView滑动，使用外层的ScrollView滑动
      //   physics: const NeverScrollableScrollPhysics(),
      //   itemCount: 0,
      //   itemBuilder: (_, index) => _getOrderGoodsItem(index),
      // ),
      Gaps.vGap8,
      _getOrderInfoItem('运输时间:', '2018/08/26 12:20'),
      _getOrderInfoItem('发货人:', '测试'),
      _getOrderInfoItem('发货地址:', '浙江省杭州市萧山区中东国际'),
      _getOrderInfoItem('收货人:', '测试'),
      _getOrderInfoItem('收货地址:', '安徽省合肥庐阳区'),
      _getOrderInfoItem('货物信息:', '杭州中空玻璃/15吨/100件'),
      Gaps.vGap24,

      const Text(
        '备注信息',
        style: TextStyle(
            fontSize: 17, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      // Gaps.line,
      Gaps.vGap8,
      _getOrderInfoItem('备注信息:', '1256324856942'),

      Gaps.vGap24,

      const Text(
        '订单信息',
        style: TextStyle(
            fontSize: 17, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      Gaps.vGap12,
      _getOrderInfoItem('订单编号:', '1256324856942'),
      _getOrderInfoItem('下单时间:', '2018/08/26 12:20'),
      _getOrderInfoItem('运输费用:', '在线支付/支付宝'),
      _getOrderInfoItem('配送方式:', '送货上门'),

      Gaps.vGap24,

      const Text(
        '评价信息',
        style: TextStyle(
            fontSize: 17, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      Gaps.vGap12,

      _getOrderInfoItem('订单编号:', widget.orderId),

      _getOrderInfoItem('下单时间:', '2018/08/26 12:20'),

      _getOrderInfoItem('支付方式:', '在线支付/支付宝'),

      _getOrderInfoItem('配送方式:', '送货上门'),

      _getOrderInfoItem('客户备注:', '无'),

      _getOrderInfoItem('配送方式:', '送货上门'),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('订单详情'),
        ),
        body: MyScrollView(
          key: const Key('order_info'),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: children,
          // bottomButton: bottomMenu,
        ));
  }

  Widget _getOrderInfoItem(String title, String content) {
    return MergeSemantics(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: Dimens.font_sp14)),
            Gaps.hGap8,

            Text(
              content,
              // textDirection: TextDirection.ltr,
            ),

            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Text(
            //     content,
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Widget _getOrderGoodsItem(int index) {
    var item = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Container(
        //   child: const LoadAssetImage('order/icon_goods', width: 56.0, height: 56.0),
        //   margin: const EdgeInsets.only(top: 5.0),
        // ),
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
        // Text('x1', style: TextStyles.textSize12),
        Gaps.hGap32,

        ///  Text(Utils.formatPrice('25'), style: TextStyles.textBold14),
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

  Widget _getGoodsInfoItem(String title, String content,
      {Color contentTextColor}) {
    return MergeSemantics(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title),
            Text(content,
                style: TextStyle(
                    color: contentTextColor ??
                        Theme.of(context).textTheme.bodyText2.color,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
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
              //   onPressed: () => NavigatorUtils.goBack(context),
              //   child: const Text('取消'),
              // ),
              FlatButton(
                // onPressed: () {
                //   Utils.launchTelURL(phone);
                //   NavigatorUtils.goBack(context);
                // },
                textColor: Theme.of(context).errorColor,
                child: const Text('拨打'),
              ),
            ],
          );
        });
  }
}
