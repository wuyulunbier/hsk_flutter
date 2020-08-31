import 'package:flutter/material.dart';
import 'package:hsk_flutter/widgets/click_item.dart';

class UpdateVersionPage extends StatefulWidget {
  UpdateVersionPageState createState() => UpdateVersionPageState();
}

class UpdateVersionPageState extends State<UpdateVersionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: const FlexibleSpaceBar(
          title: const Text(
            '版本信息',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          ClickItem(
            title: '版本更新',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
