// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCommentModel _$PostCommentModelFromJson(Map<String, dynamic> json) =>
    PostCommentModel(
      json['postId'] as int?,
      json['id'] as int?,
      json['name'] as String?,
      json['body'] as String?,
      json['email'] as String?,
    );

Map<String, dynamic> _$PostCommentModelToJson(PostCommentModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'body': instance.body,
      'email': instance.email,
    };
