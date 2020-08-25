// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userOrderModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOrderModel _$UserOrderModelFromJson(Map<String, dynamic> json) {
  return UserOrderModel(
    FromAddr: json['FromAddr'] as String,
    ToAddr: json['ToAddr'] as String,
    OrderID: json['OrderID'] as String,
    HwPic: json['HwPic'] as String,
    HwName: json['HwName'] as String,
    HwQuantity: json['HwQuantity'] as num,
    HwWeight: json['HwWeight'] as num,
  );
}

Map<String, dynamic> _$UserOrderModelToJson(UserOrderModel instance) =>
    <String, dynamic>{
      'FromAddr': instance.FromAddr,
      'ToAddr': instance.ToAddr,
      'OrderID': instance.OrderID,
      'HwPic': instance.HwPic,
      'HwName': instance.HwName,
      'HwQuantity': instance.HwQuantity,
      'HwWeight': instance.HwWeight,
    };
