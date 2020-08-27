// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commitInfoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

commitInfo _$commitInfoFromJson(Map<String, dynamic> json) {
  return commitInfo(
    EvaluationContent: json['EvaluationContent'] as String,
    EvaluationTag: json['EvaluationTag'] as String,
  );
}

Map<String, dynamic> _$commitInfoToJson(commitInfo instance) =>
    <String, dynamic>{
      'EvaluationContent': instance.EvaluationContent,
      'EvaluationTag': instance.EvaluationTag,
    };
