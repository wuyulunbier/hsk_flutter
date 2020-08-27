import 'package:json_annotation/json_annotation.dart';

part 'commitInfoModel.g.dart';

@JsonSerializable()
class commitInfo {
  final String EvaluationContent;
  final String EvaluationTag;

  commitInfo({
    this.EvaluationContent,
    this.EvaluationTag,
  });

  factory commitInfo.fromJson(Map<String, dynamic> json) =>
      _$commitInfoFromJson(json);

  Map<String, dynamic> toJson() => _$commitInfoToJson(this);
}
