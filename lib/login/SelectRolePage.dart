import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hsk_flutter/login/RoleItem.dart';
import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';
import "package:hsk_flutter/util/screen_utils.dart";
import 'package:hsk_flutter/public.dart';
import 'package:hsk_flutter/provider/SelctRoleModel.dart';

class SelectRolePage extends StatefulWidget {
  _SelectRolePageState createState() => _SelectRolePageState();
}

class _SelectRolePageState extends State<SelectRolePage> {
  bool isSelectRole = false;

  @override
  void initState() {
    super.initState();

    //;

    print(isSelectRole);

    print('6666');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          height: ScreenUtils.screenH(context),
          width: ScreenUtils.screenW(context),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Text("选择身份"),
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0, 64, 0, 0),
              ),
              RoleItem(
                title: '我是司机',
                imgUrl: 'assets/images/driver_role_normal_v1@2x.png',
                selectImgUrl: 'assets/images/driver_role_select_v1@2x.png',
                onTap: () {
                  print('select driver');
                  isSelectRole = true;
                },
              ),
              RoleItem(
                title: '我是承运商',
                imgUrl: 'assets/images/company_role_normal_v1@2x.png',
                selectImgUrl: 'assets/images/company_role_select_v1@2x.png',
                onTap: () {
                  print('select company');
                  isSelectRole = true;
                  print(isSelectRole);
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: GestureDetector(
                  onTap: () {
                    //isSelectRole = context.watch<SelctRoleModel>().isSelectRole;

                    print(isSelectRole);

                    print('5555');

                    if (isSelectRole) {
                      NavigatorUtils.push(context, CenterRouter.loginPage);
                    } else {
                      Fluttertoast.showToast(
                          msg: '请选择身份', gravity: ToastGravity.BOTTOM);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    width: 200,
                    height: 40,
                    //color: Colors.red,//
                    child: Text(
                      '下一步',
                      style: TextStyle(
                        color: Colors.white, //字体颜色
                        fontSize: 16.0, //字体大小，注意flutter里面是double类型
                        fontWeight: FontWeight.bold, //字体粗细
                        fontStyle: FontStyle.italic, // 斜体显示
                        letterSpacing: 5.0, //字体间距
                        wordSpacing: 30.0, //词间距
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
