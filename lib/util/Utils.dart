import 'package:hsk_flutter/util/SpUtil.dart';
import 'package:hsk_flutter/public.dart';

/**
 * 
 * 公共方法
 */
class Utils {
  static bool isLogin() {
    // SharedPreferences pres = await SharedPreferences.getInstance();
    //bool islogin = pres.getBool('islogin');

    bool islogin = SpUtil.getBool('islogin');
    if (islogin) {
      return true;
    } else {
      return false;
    }
  }

/**
 * other method
 */

}
