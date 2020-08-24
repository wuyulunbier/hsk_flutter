import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hsk_flutter/JSON/userOrderModel.dart';
import 'package:hsk_flutter/app/RequestManager.dart';
import 'package:hsk_flutter/widgets/my_scroll_view.dart';
import 'package:hsk_flutter/res/gaps.dart';
import 'package:hsk_flutter/res/dimens.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';
import 'package:hsk_flutter/JSON/userOrderModel.dart';

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
                        refreshText: '释放刷新',
                        refreshReadyText: '释放刷新',
                        refreshingText: '正在刷新',
                        refreshedText: '刷新完成',
                        refreshFailedText: '刷新失败',
                        noMoreText: '暂无更多数据',
                        // infoText: S.of(context).updateAt,
                      )
                    : null,
                footer: _enableLoad
                    ? ClassicalFooter(
                        enableInfiniteLoad: _enableInfiniteLoad,
                        enableHapticFeedback: _vibration,
                        // loadText: S.of(context).pushToLoad,
                        // loadReadyText: S.of(context).releaseToLoad,
                        // loadingText: S.of(context).loading,
                        // loadedText: S.of(context).loaded,
                        // loadFailedText: S.of(context).loadFailed,
                        noMoreText: '暂无更多数据',
                        // infoText: S.of(context).updateAt,
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
                        return _getOrderGoodsItem(index);
                      },
                      childCount: _listArr.length,
                    ),
                  ),
                ])));
  }

  Widget _getOrderGoodsItem(int index) {
    UserOrderModel info = _listArr[index];
    var item = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Gaps.hGap16,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Gaps.vGap32,
              Text(
                '${info.FromAddr}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Gaps.vGap4,
              Text('${info.ToAddr}',
                  style: Theme.of(context).textTheme.subtitle2),
              Gaps.vGap8,
              FlatButton(
                onPressed: () {
                  NavigatorUtils.push(context,
                      '${CenterRouter.orderDetailPage}?orderId=${info.OrderID}'); //路由传值  将订单的orderId传到详情页面
                },
                child: Text('第${index}个订单'),
                color: Colors.orange,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: FlatButton(
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
                      color: Colors.blue,
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
              // Gaps.hGap16,
              // Gaps.hGap16,
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
          padding: const EdgeInsets.symmetric(vertical: 0), child: item),
    );
  }
}
