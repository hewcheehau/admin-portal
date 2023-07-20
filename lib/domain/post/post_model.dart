import 'package:admin_portal/infrastructure/core/type_def.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {

  @JsonKey(name: "userId")
  final int? userId;

  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "title")
  final String? title;

  @JsonKey(name: "body")
  final String? body;

  PostModel(this.userId, this.id, this.title, this.body);

  factory PostModel.fromJson(json) => _$PostModelFromJson(json);

  Jmap toJson() => _$PostModelToJson(this);
}