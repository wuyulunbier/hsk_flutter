import 'package:flutter/material.dart';
import 'package:hsk_flutter/widgets/click_item.dart';
import 'package:package_info/package_info.dart';

class UpdateVersionPage extends StatefulWidget {
  UpdateVersionPageState createState() => UpdateVersionPageState();
}

class UpdateVersionPageState extends State<UpdateVersionPage> {
  String version;

  @override
  void initState() {
    super.initState();

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) => {
          print(packageInfo.version),
          print('666'),
          version = packageInfo.version,
          setState(() {}),
        });
  }

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
            content: '${version}',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
