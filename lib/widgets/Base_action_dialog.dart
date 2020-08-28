import 'package:flutter/material.dart';
import 'package:hsk_flutter/widgets/Base_dialog.dart';

class BaseActionDialog extends StatefulWidget {
  const BaseActionDialog({
    Key key,
    this.onPressed,
    @required this.title,
    @required this.content,
  }) : super(key: key);

  final String title;
  final String content;
  final VoidCallback onPressed;

  @override
  _BaseActionDialogState createState() => _BaseActionDialogState();
}

class _BaseActionDialogState extends State<BaseActionDialog> {
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: widget.title,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(widget.content, style: TextStyle(fontSize: 15)),
      ),
      onPressed: this.widget.onPressed,
    );
  }
}
