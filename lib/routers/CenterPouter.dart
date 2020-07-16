import 'package:hsk_flutter/routers/router_init.dart';
import 'package:fluro/fluro.dart';

import 'package:hsk_flutter/pages/OrderDetailPage.dart';

class CenterRouter implements IRouterProvider {
  static String orderDetailPage = "/login";
  static String registerPage = "/login/register";

  @override
  void initRouter(Router router) {
    router.define(orderDetailPage,
        handler: Handler(handlerFunc: (_, params) => OrderDetailPage()));
  }
}
