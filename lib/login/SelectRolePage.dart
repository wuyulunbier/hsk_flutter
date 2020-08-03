import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hsk_flutter/login/RoleItem.dart';
import 'package:hsk_flutter/routers/fluro_navigator.dart';
import 'package:hsk_flutter/routers/CenterPouter.dart';

class SelectRolePage extends StatefulWidget {
  selectRolePageState createState() => selectRolePageState();
}

class selectRolePageState extends State<SelectRolePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Text("选择身份"),
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(0, 64, 0, 0),
          ),
          RoleItem(
              title: '我是司机',
              imgUrl: 'assets/images/driver_role_select_v1@2x.png',
              onTap: () =>
                  NavigatorUtils.push(context, CenterRouter.loginPage)),
          RoleItem(
              title: '我是承运商',
              imgUrl: 'assets/images/company_role_select_v1@2x.png',
              onTap: () =>
                  NavigatorUtils.push(context, CenterRouter.loginPage)),
          FlatButton(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
            onPressed: null,
            child: GestureDetector(
                onTap: () =>
                    {NavigatorUtils.push(context, CenterRouter.loginPage)},
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,
                  ),
                  child: Text(
                    '下一步',
                    style: TextStyle(
                      color: Colors.white, //字体颜色
                      fontSize: 16.0, //字体大小，注意flutter里面是double类型
                      fontWeight: FontWeight.bold, //字体粗细
                      //fontStyle: FontStyle.italic, // 斜体显示
                      letterSpacing: 10.0, //字体间距
                      wordSpacing: 30.0, //词间距
                    ),
                  ),
                  width: 160,
                  alignment: Alignment.center,
                )),
          )
        ],
      ),
    );
  }
}