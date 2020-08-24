import 'package:shared_preferences/shared_preferences.dart';

/**
 * 
 * 公共方法
 */
class Utils {
  static Future<bool> isLogin() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    bool islogin = pres.getBool('islogin');

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
