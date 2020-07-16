import 'package:flutter/material.dart';

class HomeItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeItemstate();
  }
}

class HomeItemstate extends State<HomeItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    List<String> list = ['33', '44'];

    return Container(
      child: Text(
        list[1],
      ),
    );
  }
}
