import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '订单详情',
          ),
        ),
        backgroundColor: Colors.green,
        body: Container(
          height: 200,
          margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: Text('测试路由跳转'),
        ));
  }
}
