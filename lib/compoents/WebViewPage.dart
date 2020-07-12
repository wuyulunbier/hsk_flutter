/*
 * @Author: your name
 * @Date: 2020-07-12 20:23:55
 * @LastEditTime: 2020-07-12 20:26:15
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /hsk_flutter/lib/compoents/WebViewPage.dart
 */ 


import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class WebViewPage extends StatelessWidget {
  final String url;
  final dynamic params;
  static final String TITLE = 'title';

  WebViewPage(this.url, {Key key, this.params}) : super(key: key);
//  final _webviewReference = FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {
//    _webviewReference.close();
//    _webviewReference.dispose();

    return WebviewScaffold(
      url: url,
      appBar: AppBar(
        title: Text(params[TITLE]),
        backgroundColor: Colors.green,
      ),
    );
  }

}
