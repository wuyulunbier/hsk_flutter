import 'package:flutter/material.dart';
import 'package:hsk_flutter/widgets/my_scroll_view.dart';
import 'package:hsk_flutter/res/gaps.dart';
import 'package:hsk_flutter/res/dimens.dart';
import 'package:hsk_flutter/public.dart';
import 'package:hsk_flutter/JSON/orderDetailInfoModel.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({Key key, this.orderId}) : super(key: key);

  final String orderId;

  @override
  _orderInfoPageState createState() => _orderInfoPageState();
}

class _orderInfoPageState extends State<OrderDetailPage> {
  DetailInfo model;
  bool _isCompleteload = false;

  Future loadData() async {
    await Future.delayed(const Duration(seconds: 1), () {
      var params = {'id': 28805, 'type': '1', 'carid': 808};
      RequestManager.getInstance().post(
          'http://apiwl3.atjubo.com/ServiceInterface/JuMaWuLiu/WuLiuOrder.asmx/getIntegrationOrderDetailsByCar',
          params, (data) {
        var map = data['d']['ReList'][0]['Order'];
        model = DetailInfo.fromJson(map);
        _isCompleteload = true;

        setState(() {});
      }, (error) {
        print(error);
      });
    });
  }

  @override
  void initState() {
    //
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('订单详情'),
      ),
      body: FutureBuilder(
        future: loadData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (_isCompleteload) {
            return MyScrollView(
              key: const Key('order_info'),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              children: [
                Gaps.vGap24,
                const Text(
                  '货物信息',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Gaps.vGap8,
                _getOrderInfoItem('运输时间:', '2018/08/26 12:20'),
                _getOrderInfoItem('发货人:', '${model.SenderName}'),
                _getOrderInfoItem('发货地址:', '${model.FromAddr}'),
                _getOrderInfoItem('收货人:', '${model.RecipientsName}'),
                _getOrderInfoItem('收货地址:', '${model.ToAddr}'),
                _getOrderInfoItem(
                    '货物信息:',
                    '${model.HWName}/' +
                        '${model.ToWeight}吨/' +
                        '${model.HWQuantity}件'),
                Gaps.vGap24,
                const Text(
                  '备注信息',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Gaps.vGap8,
                _getOrderInfoItem('备注信息:', '${model.Remark}'),
                Gaps.vGap24,
                const Text(
                  '订单信息',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Gaps.vGap12,
                _getOrderInfoItem('订单编号:', '${model.OrderID}'),
                _getOrderInfoItem('下单时间:', '${model.SendTime}'),
                _getOrderInfoItem('配送方式:', '送货上门'),
                Gaps.vGap24,
                const Text(
                  '评价信息',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Gaps.vGap12,
                _getOrderInfoItem(
                    '评价内容:', '${model.OrderEvaluation.EvaluationContent}'),
                _getOrderInfoItem(
                    '评价内容:', '${model.OrderEvaluation.EvaluationTag}'),
                _getOrderInfoItem(
                    '评价内容:', '${model.OrderEvaluation.EvaluationContent}'),
                _getOrderInfoItem(
                    '评价内容:', '${model.OrderEvaluation.EvaluationContent}'),
                _getOrderInfoItem(
                    '评价内容:', '${model.OrderEvaluation.EvaluationContent}'),
                _getOrderInfoItem(
                    '评价内容:', '${model.OrderEvaluation.EvaluationContent}'),
              ],
            );
          } else {
            return Center(
                child: SpinKitCircle(
              color: Colors.blue,
              size: 60.0,
            )
                // SpinKitRotatingCircle(
                //   color: Colors.blue,
                //   size: 50.0,
                // ),
                );
          }
        },
      ),
    );
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
