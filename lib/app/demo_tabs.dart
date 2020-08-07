import 'package:flutter/material.dart';

class DemoTabViewModel {
  final String title;
  final Widget widget;

  const DemoTabViewModel({
    this.title,
    this.widget,
  });
}

class DemoTabs extends StatelessWidget {
  final String title;
  final List<DemoTabViewModel> demos;
  final bool tabScrollable;
  final TabController tabController;

  DemoTabs({
    this.title,
    this.demos,
    this.tabScrollable = true,
    this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.red,
        title: Text(this.title),
        bottom: TabBar(
          labelPadding: EdgeInsets.only(left: 30, right: 30),
          indicatorColor: Colors.white,
          controller: this.tabController,
          isScrollable: this.tabScrollable,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: this.demos.map((item) => Tab(text: item.title)).toList(),
        ),
      ),
      body: TabBarView(
        controller: this.tabController,
        children: this.demos.map((item) => item.widget).toList(),
      ),
    );
  }
}
