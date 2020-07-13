import 'package:flutter/material.dart';
import 'package:hsk_flutter/constant/constant.dart';

class OrderListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '排期',
        ),
      ),
      backgroundColor: Colors.red,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: false,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 15.0, bottom: 20.0, right: 10.0),
                    child: Image.asset(
                      'assets/images/ic_notify.png',
                      width: 30.0,
                      height: 30.0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '订单页面66677',
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
