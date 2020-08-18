import 'package:fluro/fluro.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';
import 'package:hsk_flutter/routers/LoginRouter.dart';
import 'package:hsk_flutter/routers/router_init.dart';
import 'package:flutter/material.dart';
import 'package:hsk_flutter/compoents/WebViewPage.dart';

// ignore: avoid_classes_with_only_static_members
class Routes {
  static String webViewPage = '/webview';

  static final List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    /// 指定路由跳转错误返回页

    _listRouter.clear();

    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(CenterRouter());
    _listRouter.add(LoginRouter());

    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
      final String title = params['title']?.first;
      final String url = params['url']?.first;
      return WebViewPage(title: title, url: url);
    }));

    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
