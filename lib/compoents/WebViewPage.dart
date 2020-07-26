/*
 * @Author: your name
 * @Date: 2020-07-12 20:23:55
 * @LastEditTime: 2020-07-12 20:26:15
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /hsk_flutter/lib/compoents/WebViewPage.dart
 */

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    Key key,
    @required this.title,
    @required this.url,
  }) : super(key: key);

  final String title;
  final String url;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    print(widget.url + '66666');
    return FutureBuilder<WebViewController>(
        future: _controller.future, //使用异步加载
        builder: (context, snapshot) {
          return WillPopScope(
            onWillPop: () async {
              if (snapshot.hasData) {
                var canGoBack = await snapshot.data.canGoBack();
                if (canGoBack) {
                  // 网页可以返回时，优先返回上一页
                  await snapshot.data.goBack();
                  return Future.value(false);
                }
              }
              return Future.value(true);
            },
            child: Scaffold(
                appBar: AppBar(
                  // centerTitle: widget.title,
                  title: Text(
                    widget.title,
                    style: new TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                body: WebView(
                  initialUrl: widget.url,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  },
                )),
          );
        });
  }
}
