import 'package:flutter/material.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';
import 'package:hsk_flutter/widgets/Base_dialog.dart';
import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/public.dart';

class ExitDialog extends StatefulWidget {
  const ExitDialog({
    Key key,
  }) : super(key: key);

  @override
  _ExitDialog createState() => _ExitDialog();
}

class _ExitDialog extends State<ExitDialog> {
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: '提示',
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text('您确定要退出登录吗？', style: TextStyle(fontSize: 15)),
      ),
      onPressed: () {
        //SharedPreferences pres1 = await SharedPreferences.getInstance();

        //pres1.setBool('islogin', true);

        SpUtil.putBool('islogin', false);

        NavigatorUtils.push(context, CenterRouter.loginPage, clearStack: true);
      },
    );
  }
}
