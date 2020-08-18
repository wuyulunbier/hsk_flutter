import 'package:hsk_flutter/login/LoginPage.dart';
import 'package:hsk_flutter/routers/router_init.dart';
import 'package:fluro/fluro.dart';

import 'package:hsk_flutter/login/UpdatePassWordPage.dart';
import 'package:hsk_flutter/pages/PersonSetPage.dart';

import 'package:hsk_flutter/compoents/WebViewPage.dart';
import 'package:hsk_flutter/login/ChangPhonePage.dart';
import 'package:hsk_flutter/login/NotifySetPage.dart';

class LoginRouter implements IRouterProvider {
  static String registerPage = "/login/register";
  static String personsetPage = "/set";
  static String webViewPage = "/webview";
  static String loginPage = "/login";
  static String updatePwdPage = "/updatePwd";
  static String changePage = "/change";
  static String notifyPage = "/notifypage";

  @override
  void initRouter(Router router) {
    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
      final String title = params['title']?.first;
      final String url =
          params['https://github.com/simplezhli/flutter_deer']?.first;
      return WebViewPage(title: title, url: url);
    }));

    router.define(personsetPage,
        handler: Handler(handlerFunc: (_, params) => PersonSetPage()));

    router.define(updatePwdPage,
        handler: Handler(handlerFunc: (_, params) => UpdatePasswordPage()));

    router.define(changePage,
        handler: Handler(handlerFunc: (_, params) => ChangePhonePage()));

    router.define(notifyPage,
        handler: Handler(handlerFunc: (_, params) => NotifySetPage()));

    router.define(loginPage,
        handler: Handler(handlerFunc: (_, params) => LoginPage()));
  }
}
