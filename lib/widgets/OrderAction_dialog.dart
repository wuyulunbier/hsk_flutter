import 'package:flutter/material.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';
import 'package:hsk_flutter/widgets/Base_dialog.dart';
import 'package:hsk_flutter/routers/fluro_navigator.dart';

class OrderActionDialog extends StatefulWidget {
  const OrderActionDialog({
    Key key,
    @required this.title,
    @required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  _OrderActionDialogState createState() => _OrderActionDialogState();
}

class _OrderActionDialogState extends State<OrderActionDialog> {
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: '温馨提示',
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text('您确定要接单么？', style: TextStyle(fontSize: 15)),
      ),
      onPressed: () {
        NavigatorUtils.push(context, CenterRouter.loginPage, clearStack: true);
      },
    );
  }
}
