// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginInfoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

loginInfo _$loginInfoFromJson(Map<String, dynamic> json) {
  return loginInfo(
    DriverName: json['DriverName'] as String,
    DriverTel: json['DriverTel'] as String,
    CarHeight: (json['CarHeight'] as num)?.toDouble(),
    CarLen: (json['CarLen'] as num)?.toDouble(),
    CarNo: json['CarNo'] as String,
    HeadPic: json['HeadPic'] as String,
    CarType: json['CarType'] as int,
    CreateTime: json['CreateTime'] as String,
  );
}

Map<String, dynamic> _$loginInfoToJson(loginInfo instance) => <String, dynamic>{
      'DriverName': instance.DriverName,
      'DriverTel': instance.DriverTel,
      'CarHeight': instance.CarHeight,
      'CarLen': instance.CarLen,
      'CarNo': instance.CarNo,
      'HeadPic': instance.HeadPic,
      'CarType': instance.CarType,
      'CreateTime': instance.CreateTime,
    };
