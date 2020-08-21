import 'package:json_annotation/json_annotation.dart';

part 'personModel.g.dart'; //严格区分大小写，且必须是文件名中间加上g.，否则无法成功。另外也是必须的，因为要生成一个转换部分文件

@JsonSerializable()
class Data {
  final String by;
  //final int descendants;
  final int id;
  final List<int> kids;
  final int score;
  final int time;
  final String title;
  final String type;
  final String url;
  final String name;

  Data(
      {this.by,

      ///this.descendants,
      this.id,
      this.kids,
      this.score,
      this.time,
      this.title,
      this.type,
      this.url,
      this.name});

  // 使用命名构造函数从另一类或现有的数据中快速实现构造函数。
  // 一个User.fromJson 构造函数, 用于从一个map构造出一个 User实例 map structure
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  // 一个toJson 方法, 将 User 实例转化为一个map.
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
