import 'package:flutter/material.dart';
import 'package:hsk_flutter/res/gaps.dart';
import 'package:hsk_flutter/res/dimens.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';

import 'package:hsk_flutter/widgets/Order_item.dart';
import 'package:hsk_flutter/JSON/userOrderModel.dart';
import 'package:hsk_flutter/app/RequestManager.dart';

class OrderCompletPage extends StatefulWidget {
  _orderCompletePageState createState() => _orderCompletePageState();
}

class _orderCompletePageState extends State<OrderCompletPage> {
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

  @override
  Widget build(BuildContext context) {
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
                header: _enableRefresh ? PhoenixHeader() : null,
                footer: _enableLoad ? PhoenixFooter() : null,
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
                        await Future.delayed(Duration(seconds: 2), () {
                          if (mounted) {
                            setState(() {
                              _count += 20;
                            });
                            if (!_enableControlFinish) {
                              _controller.finishLoad(noMore: _count >= 80);
                            }
                          }
                        });
                      }
                    : null,
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (_listArr.length > 0) {
                          UserOrderModel model = _listArr[index];

                          return OrderItem(
                            index: index,
                            model: model,
                            onSelectAction: () {},
                            onCancelAction: () {},
                            onTap: () {
                              print(model.OrderID + '88888');
                              NavigatorUtils.push(context,
                                  '${CenterRouter.orderDetailPage}?orderId=${model.OrderID}'); //路由传值  将订单的orderId传到详情页面
                            },
                          ); //_getOrderG
                        }
                      },
                      childCount: _count,
                    ),
                  ),
                ])

            // padding: const EdgeInsets.only(top: 16.0),
            // child: ListView.builder(
            //   // 如果滚动视图在滚动方向无界约束，那么shrinkWrap必须为true
            //   shrinkWrap: true,
            //   // scrollDirection: Axis.vertical,
            //   // 禁用ListView滑动，使用外层的ScrollView滑动
            //   physics: const AlwaysScrollableScrollPhysics(),
            //   itemCount: 26,
            //   itemBuilder: (_, index) => _getOrderGoodsItem(index),
            // ),
            ));
  }
}
