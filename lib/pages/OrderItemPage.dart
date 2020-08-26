import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:hsk_flutter/app/RequestManager.dart';
import 'package:hsk_flutter/widgets/Order_item.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';

import 'package:hsk_flutter/public.dart';
import 'package:hsk_flutter/widgets/OrderAction_dialog.dart';
import 'package:hsk_flutter/res/i18n.dart';

class OrderItemPage extends StatefulWidget {
  const OrderItemPage({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderItemPage> {
  EasyRefreshController _controller;
  ScrollController _scrollController;

  // 条目总数
  int _count = 20;
  // 反向
  bool _reverse = false;
  // 方向
  Axis _direction = Axis.vertical;
  // Header浮动
  bool _headerFloat = false;
  // 无限加载
  bool _enableInfiniteLoad = true;
  // 控制结束
  bool _enableControlFinish = false;
  // 任务独立
  bool _taskIndependence = false;
  // 震动
  bool _vibration = true;
  // 是否开启刷新
  bool _enableRefresh = true;
  // 是否开启加载
  bool _enableLoad = true;
  // 顶部回弹
  bool _topBouncing = true;
  // 底部回弹
  bool _bottomBouncing = true;

  int pageIndex = 1;

  List<UserOrderModel> _listArr = <UserOrderModel>[];

  @override
  void initState() {
    super.initState();

    var params = {'carid': 808, 'state': '3', 'page': pageIndex};
    RequestManager.getInstance().post(
        'http://apiwl3.atjubo.com/ServiceInterface/JuMaWuLiu/WuLiuOrder.asmx/getIntegrationOrderListByCarid',
        params, (data) {
      //  print(data);

      var list = data['d']['ReList'][0];

      print('88888');
      for (Map order in list) {
        UserOrderModel model = UserOrderModel.fromJson(order);
        print(model.FromAddr);

        _listArr.add(model);
        setState(() {});

        print(model.ToAddr);
      }
    }, (error) {
      print(error);
    });

    _controller = EasyRefreshController();
    _scrollController = ScrollController();
  }

  // http://apiwl3.atjubo.com/ServiceInterface/JuMaWuLiu/WuLiuOrder.asmx/getIntegrationOrderListByCarid
  //
  /**
    * {
	 "carid": 808,
	 "state": "3",
	 "page": 1
}
    */

  @override
  Widget build(BuildContext context) {
    void _showOrderDialog() {
      showDialog<void>(
          context: context,
          builder: (_) => const OrderActionDialog(
                title: '温馨提示',
                content: '是否确认接单',
              ));
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            key: const Key('order_info'),
            height: _direction == Axis.vertical ? double.infinity : 210.0,
            child: EasyRefresh.custom(
                enableControlFinishRefresh: true,
                enableControlFinishLoad: true,
                taskIndependence: _taskIndependence,
                controller: _controller,
                scrollController: _scrollController,
                reverse: _reverse,
                scrollDirection: _direction,
                topBouncing: _topBouncing,
                bottomBouncing: _bottomBouncing,
                header: _enableRefresh
                    ? ClassicalHeader(
                        enableInfiniteRefresh: false,
                        bgColor: _headerFloat
                            ? Theme.of(context).primaryColor
                            : null,
                        infoColor: _headerFloat ? Colors.black87 : Colors.teal,
                        float: _headerFloat,
                        enableHapticFeedback: _vibration,
                        refreshText: S.of(context).pullToRefresh,
                        refreshReadyText: S.of(context).releaseToRefresh,
                        refreshingText: S.of(context).refreshing,
                        refreshedText: S.of(context).refreshed,
                        refreshFailedText: S.of(context).refreshFailed,
                        noMoreText: S.of(context).noMore,
                        infoText: S.of(context).updateAt,
                      )
                    : null,
                footer: _enableLoad
                    ? ClassicalFooter(
                        enableInfiniteLoad: _enableInfiniteLoad,
                        enableHapticFeedback: _vibration,
                        noMoreText: '暂无更多数据',
                      )
                    : null,
                onRefresh: _enableRefresh
                    ? () async {
                        pageIndex = 1;
                        var params = {
                          'carid': 808,
                          'state': '3',
                          'page': pageIndex
                        };
                        RequestManager.getInstance().post(
                            'http://apiwl3.atjubo.com/ServiceInterface/JuMaWuLiu/WuLiuOrder.asmx/getIntegrationOrderListByCarid',
                            params, (data) {
                          //  print(data);
                          _listArr.clear();

                          var list = data['d']['ReList'][0];

                          print('88888');
                          for (Map order in list) {
                            UserOrderModel model =
                                UserOrderModel.fromJson(order);
                            print(model.FromAddr);
                            _listArr.add(model);
                            print(model.ToAddr);
                          }
                        }, (error) {
                          print(error);
                        });

                        await Future.delayed(Duration(seconds: 2), () {
                          if (mounted) {
                            setState(() {
                              _count = 20;
                            });
                            if (!_enableControlFinish) {
                              _controller.resetLoadState();
                              _controller.finishRefresh();
                            }
                          }
                        });
                      }
                    : null,
                onLoad: _enableLoad
                    ? () async {
                        pageIndex += 1;
                        var params = {
                          'carid': 808,
                          'state': '3',
                          'page': pageIndex
                        };

                        RequestManager.getInstance().post(
                            'http://apiwl3.atjubo.com/ServiceInterface/JuMaWuLiu/WuLiuOrder.asmx/getIntegrationOrderListByCarid',
                            params, (data) {
                          var list = data['d']['ReList'][0];
                          if (!_enableControlFinish) {
                            _controller.finishLoad(noMore: list.length == 0);
                          }

                          for (Map order in list) {
                            UserOrderModel model =
                                UserOrderModel.fromJson(order);
                            print(model.FromAddr);
                            _listArr.add(model);
                            print(model.ToAddr);
                          }
                        }, (error) {
                          print(error);
                        });
                        await Future.delayed(Duration(seconds: 2), () {
                          if (mounted) {
                            setState(() {});
                          }
                        });
                      }
                    : null,
                slivers: <Widget>[
                  //  Text('data'),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        UserOrderModel model = _listArr[index];

                        return OrderItem(
                          index: index,
                          model: model,
                          onCancelAction: () {
                            print('我要拒单');
                          },
                          onSelectAction: () => _showOrderDialog(),
                          onTap: () {
                            print(model.OrderID + '88888');
                            NavigatorUtils.push(context,
                                '${CenterRouter.orderDetailPage}?orderId=${model.OrderID}'); //路由传值  将订单的orderId传到详情页面
                          },
                        );
                      },
                      childCount: _listArr.length,
                    ),
                  ),
                ])));
  }
}
