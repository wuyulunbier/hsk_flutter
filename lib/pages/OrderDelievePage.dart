import 'package:flutter/material.dart';
import 'package:hsk_flutter/widgets/my_scroll_view.dart';
import 'package:hsk_flutter/res/gaps.dart';
import 'package:hsk_flutter/res/dimens.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';

class OrderDelievePage extends StatefulWidget {
  _orderDelievePageState createState() => _orderDelievePageState();
}

class _orderDelievePageState extends State<OrderDelievePage> {
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

  @override
  void initState() {
    super.initState();
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
                header: _enableRefresh
                    ? DeliveryHeader(
                        backgroundColor: Colors.grey[100],
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
                        // noMoreText: S.of(context).noMore,
                        // infoText: S.of(context).updateAt,
                      )
                    : null,
                onRefresh: _enableRefresh
                    ? () async {
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
                        return _getOrderGoodsItem(index);
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

  Widget _getOrderGoodsItem(int index) {
    var item = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text('data'),
          margin: const EdgeInsets.only(top: 5.0),
        ),
        Gaps.hGap8,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                index % 2 == 0 ? '666泊泉雅花瓣·浪漫亲肤玫瑰沐浴乳' : '日本纳鲁火多橙饮',
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
}
