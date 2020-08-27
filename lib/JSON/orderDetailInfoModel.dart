import 'package:json_annotation/json_annotation.dart';
import 'package:hsk_flutter/JSON/commitInfoModel.dart';

part 'orderDetailInfoModel.g.dart';

@JsonSerializable()
class DetailInfo {
  final String FromAddr;
  final String ToAddr;
  final String Remark;
  final String FromAddrDetails;
  final String ToAddrDetails;
  final String HWName;
  final num HWQuantity;
  final num ToWeight;
  final String SendTime;
  final String SenderName;
  final String RecipientsName;
  final String OrderID;

  final commitInfo OrderEvaluation;

  DetailInfo({
    this.FromAddr,
    this.ToAddr,
    this.Remark,
    this.ToAddrDetails,
    this.FromAddrDetails,
    this.HWName,
    this.HWQuantity,
    this.ToWeight,
    this.SendTime,
    this.SenderName,
    this.RecipientsName,
    this.OrderID,
    this.OrderEvaluation,
  });

  factory DetailInfo.fromJson(Map<String, dynamic> json) =>
      _$DetailInfoFromJson(json);

  // 一个toJson 方法, 将 User 实例转化为一个map.
  Map<String, dynamic> toJson() => _$DetailInfoToJson(this);
}
