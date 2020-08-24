import 'package:json_annotation/json_annotation.dart';

part 'loginInfoModel.g.dart';

@JsonSerializable()
class loginInfo {
  final String DriverName;
  final String DriverTel;
  final double CarHeight;
  final double CarLen;
  final String CarNo;
  final String HeadPic;
  final int CarType;

  // final int CarRZState;
  //final String CreateTime;

  loginInfo({
    this.DriverName,
    this.DriverTel,
    this.CarHeight,
    this.CarLen,
    this.CarNo,
    this.HeadPic,
    this.CarType,
    // this.CarRZState,
    //this.CreateTime,
  });

  // 使用命名构造函数从另一类或现有的数据中快速实现构造函数。
  // 一个User.fromJson 构造函数, 用于从一个map构造出一个 User实例 map structure
  factory loginInfo.fromJson(Map<String, dynamic> json) =>
      _$loginInfoFromJson(json);

  // // 一个toJson 方法, 将 User 实例转化为一个map.
  Map<String, dynamic> toJson() => _$loginInfoToJson(this);
}
