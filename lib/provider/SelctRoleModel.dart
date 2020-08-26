import 'package:flutter/material.dart';

/**
 * 
 * 1  添加依赖
 * 2  Provide模式中model不再需要继承Model类，只需要实现Listenable，我们这里混入ChangeNotifier，可以不用管理听众
 * 3  将状态放入顶层
 * 4  获取状态
 */
class SelctRoleModel with ChangeNotifier {
  //声明
  bool _isSelectRole;

  //实现set方法

  bool get isSelectRole => _isSelectRole;

  void selectRole(bool isSelect) {
    _isSelectRole = isSelect;

    //发送通知
    notifyListeners();
  }
}
