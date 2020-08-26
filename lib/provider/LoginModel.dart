import 'package:flutter/material.dart';
import 'package:hsk_flutter/util/SpUtil.dart';

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

  void loginSuccess() {
    _name = SpUtil.getString('userName');
    _phone = SpUtil.getString('telphone');
    _headUrl = SpUtil.getString('HeadPic');
    //发送通知
    notifyListeners();
  }
}
