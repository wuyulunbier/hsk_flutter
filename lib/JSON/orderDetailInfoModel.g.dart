// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderDetailInfoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailInfo _$DetailInfoFromJson(Map<String, dynamic> json) {
  return DetailInfo(
    FromAddr: json['FromAddr'] as String,
    ToAddr: json['ToAddr'] as String,
    Remark: json['Remark'] as String,
    ToAddrDetails: json['ToAddrDetails'] as String,
    FromAddrDetails: json['FromAddrDetails'] as String,
    HWName: json['HWName'] as String,
    HWQuantity: json['HWQuantity'] as num,
    ToWeight: json['ToWeight'] as num,
    SendTime: json['SendTime'] as String,
    SenderName: json['SenderName'] as String,
    RecipientsName: json['RecipientsName'] as String,
    OrderID: json['OrderID'] as String,
    OrderEvaluation: json['OrderEvaluation'] == null
        ? null
        : commitInfo.fromJson(json['OrderEvaluation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DetailInfoToJson(DetailInfo instance) =>
    <String, dynamic>{
      'FromAddr': instance.FromAddr,
      'ToAddr': instance.ToAddr,
      'Remark': instance.Remark,
      'FromAddrDetails': instance.FromAddrDetails,
      'ToAddrDetails': instance.ToAddrDetails,
      'HWName': instance.HWName,
      'HWQuantity': instance.HWQuantity,
      'ToWeight': instance.ToWeight,
      'SendTime': instance.SendTime,
      'SenderName': instance.SenderName,
      'RecipientsName': instance.RecipientsName,
      'OrderID': instance.OrderID,
      'OrderEvaluation': instance.OrderEvaluation,
    };
