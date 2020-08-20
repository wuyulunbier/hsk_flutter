import 'package:hsk_flutter/login/LoginPage.dart';
import 'package:hsk_flutter/routers/router_init.dart';
import 'package:fluro/fluro.dart';

import 'package:hsk_flutter/pages/OrderDetailPage.dart';

import 'package:hsk_flutter/pages/PersonSetPage.dart';

import 'package:hsk_flutter/compoents/WebViewPage.dart';

import 'package:hsk_flutter/container_page.dart';

class CenterRouter implements IRouterProvider {
  static String orderDetailPage = "/ordrdetail";
  static String registerPage = "/login/register";
  static String personsetPage = "/set";
  static String webViewPage = "/webview";
  static String loginPage = "/login";
  static String mainContainPage = '/container';

  @override
  void initRouter(Router router) {
    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
      final String title = params['title']?.first;
      final String url =
          params['https://github.com/simplezhli/flutter_deer']?.first;

      return WebViewPage(title: title, url: url);
    }));

    router.define(orderDetailPage, handler: Handler(handlerFunc: (_, params) {
      final String orderId = params['orderId']?.first;

      print('555' + orderId);

      return OrderDetailPage(orderId: orderId);
    }));

    router.define(personsetPage,
        handler: Handler(handlerFunc: (_, params) => PersonSetPage()));

    router.define(loginPage,
        handler: Handler(handlerFunc: (_, params) => LoginPage()));

    router.define(mainContainPage,
        handler: Handler(handlerFunc: (_, params) => ContainerPage()));
  }
}
