import 'package:admin_portal/infrastructure/core/type_def.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_comment_model.g.dart';

@JsonSerializable()
class PostCommentModel {

  @JsonKey(name: "postId")
  final int? postId;

  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "name")
  final String? name;

  @JsonKey(name: "body")
  final String? body;

  @JsonKey(name: "email")
  final String? email;

  PostCommentModel(this.postId, this.id, this.name, this.body, this.email);
  
  factory PostCommentModel.fromJson(json) => _$PostCommentModelFromJson(json);

  Jmap toJson() => _$PostCommentModelToJson(this);
}