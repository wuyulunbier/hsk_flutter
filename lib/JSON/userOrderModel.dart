// import 'dart:ffi';
// import 'dart:wasm';

import 'package:json_annotation/json_annotation.dart';

part 'userOrderModel.g.dart';

@JsonSerializable()
class UserOrderModel {
  final String FromAddr;
  final String ToAddr;
  final String OrderID;
  final String HwPic;
  final String HwName;
  final num HwQuantity;
  final num HwWeight;
  // final String SenderName;
  // final String RecipientsName;

  UserOrderModel({
    this.FromAddr,
    this.ToAddr,
    this.OrderID,
    this.HwPic,
    this.HwName,
    this.HwQuantity,
    this.HwWeight,
    // this.SenderName,
    // this.RecipientsName,
  });

  // 使用命名构造函数从另一类或现有的数据中快速实现构造函数。
  // 一个User.fromJson 构造函数, 用于从一个map构造出一个 User实例 map structure
  factory UserOrderModel.fromJson(Map<String, dynamic> json) =>
      _$UserOrderModelFromJson(json);

  // // 一个toJson 方法, 将 User 实例转化为一个map.
  Map<String, dynamic> toJson() => _$UserOrderModelToJson(this);
}
