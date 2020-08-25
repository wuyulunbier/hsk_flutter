import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**
 * 
 * 1  添加依赖
 * 2  Provide模式中model不再需要继承Model类，只需要实现Listenable，我们这里混入ChangeNotifier，可以不用管理听众
 * 3  将状态放入顶层
 * 4  获取状态
 */
class LoginModel with ChangeNotifier {
  //声明
  String _name;
  String _phone;
  String _headUrl;

  //实现set方法
  String get name => _name;
  String get phone => _phone;
  String get headUrl => _headUrl;

  void loginSuccess() async {
    SharedPreferences pres1 = await SharedPreferences.getInstance();

    _name = pres1.getString('userName');
    _phone = pres1.getString('phone');
    _headUrl = pres1.getString('HeadPic');

    //发送通知
    notifyListeners();
  }
}
