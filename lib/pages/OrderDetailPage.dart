import 'package:flutter/material.dart';
import 'package:hsk_flutter/widgets/MyButton.dart';
import "package:hsk_flutter/util/screen_utils.dart";

class OrderDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String hintText = '搜索书影音 小组 日记 用户等';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '订单详情',
        ),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
            child: _GroupWidget(),
          )
        ],
      )),
    );
  }
}

class _GroupWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GroupWidgetState();
}

class _GroupWidgetState extends State<_GroupWidget> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    // Future(() {
    //   return _request.get(API.IN_THEATERS);
    // }).then((result) {
    //   var resultList = result['subjects'];
    //   setState(() {
    //     list =
    //         resultList.map<Subject>((item) => Subject.fromMap(item)).toList();
    //     loading = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _getBody(),
    );
  }

  Widget _getBody() {
    return Container(
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Image.asset(
            'assets/images/person_top_bg.jpg',
            // height: 40,
            // width: ScreenUtils.screenW(context),
            // fit: BoxFit.cover,
          ),
        ));
  }
}
