import 'dart:io';

import 'package:hsk_flutter/util/SpUtil.dart';
import 'package:hsk_flutter/public.dart';

import 'package:path_provider/path_provider.dart';

/**
 * 
 * 公共方法
 */
class Utils {
  static bool isLogin() {
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

  Future<double> loadCache() async {
    try {
      Directory temDir = await getTemporaryDirectory();
      double value = await _getTotalSizeOfFilesInDir(temDir);
      return value;
    } catch (err) {}
  }

  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    try {
      if (file is File) {
        int length = await file.length();
        return double.parse(length.toString());
      }
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        double total = 0;
        if (children != null)
          for (final FileSystemEntity child in children)
            total += await _getTotalSizeOfFilesInDir(child);

        print(total);
        return total;
      }
      return 0;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  /**
   * 缓存大小格式转换
   */
  String formatSize(double value) {
    if (null == value) {
      return '0';
    }
    List<String> unitArr = List()..add('B')..add('K')..add('M')..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  /**
   * 删除缓存目录
   */

  void clearApplicationCache() async {
    Directory directory = await getApplicationDocumentsDirectory();
    await deleteDirectory(directory);
  }

  /// 递归方式删除目录
  Future<Null> deleteDirectory(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await deleteDirectory(child);
      }
    }
    await file.delete();
  }

  /**
  * 检查版本是否需要更新 获取后台接口返回的最新版本的 vsersion 值! (这需要每次APP发版提审后，同时更新后台数据库App version)；
  */

  void _checkUpdateVersion() async {}
}
