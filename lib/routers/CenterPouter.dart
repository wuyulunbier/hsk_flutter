import 'package:hsk_flutter/routers/router_init.dart';
import 'package:fluro/fluro.dart';

import 'package:hsk_flutter/pages/OrderDetailPage.dart';
import 'package:hsk_flutter/compoents/WebViewPage.dart';

class CenterRouter implements IRouterProvider {
  static String orderDetailPage = "/login";
  static String registerPage = "/login/register";
  static String webViewPage = "/webview";

  @override
  void initRouter(Router router) {
    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
      final String title = params['title']?.first;
      final String url =
          params['https://github.com/simplezhli/flutter_deer']?.first;
      return WebViewPage(title: title, url: url);
    }));

    router.define(orderDetailPage,
        handler: Handler(handlerFunc: (_, params) => OrderDetailPage()));
  }
}
