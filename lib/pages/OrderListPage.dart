import 'package:flutter/material.dart';
import 'package:hsk_flutter/app/demo_tabs.dart';
import 'color_grids.dart';
import 'color_list.dart';

class OrderListPage extends StatefulWidget {
  _GridViewDemoState createState() => _GridViewDemoState();
}

List<DemoTabViewModel> demos = [
  DemoTabViewModel(title: '待受理', widget: ColorGrids()),
  DemoTabViewModel(title: '待发货', widget: ColorList()),
  DemoTabViewModel(title: '运输中', widget: ColorGrids()),
  DemoTabViewModel(title: '已完成', widget: ColorGrids()),
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
