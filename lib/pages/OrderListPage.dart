import 'package:flutter/material.dart';
import 'package:hsk_flutter/app/demo_tabs.dart';
import 'OrderCompletPage.dart';
import 'OrderItemPage.dart';

import 'package:hsk_flutter/compoents/PullDownRefresh.dart';
import 'package:hsk_flutter/compoents/PullLoadMore.dart';
import 'OrderDelievePage.dart';

class OrderListPage extends StatefulWidget {
  _GridViewDemoState createState() => _GridViewDemoState();
}

List<DemoTabViewModel> demos = [
  DemoTabViewModel(title: '待受理', widget: OrderItemPage()),
  DemoTabViewModel(title: '待发货', widget: OrderDelievePage()),
  DemoTabViewModel(title: '运输中', widget: OrderCompletPage()),
  DemoTabViewModel(title: '已完成', widget: PullDownRefreshList()),
];

class _GridViewDemoState extends State<OrderListPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = new TabController(length: demos.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    this.tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoTabs(
      demos: demos,
      title: '订单',
      tabController: this.tabController,
    );
  }
}
