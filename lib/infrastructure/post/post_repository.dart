import 'package:admin_portal/domain/post/post_comment_model.dart';
import 'package:admin_portal/domain/post/post_model.dart';
import 'package:admin_portal/infrastructure/core/type_def.dart';
import 'package:admin_portal/infrastructure/post/post_service.dart';

abstract class PostRepository {
  Future<dynamic> getPost({int id = -1});
  Future<dynamic> getPostComment({int id = -1});
}

class PostRepositoryImpl extends PostRepository {
  final PostService postService;

  PostRepositoryImpl(this.postService);

  @override
  Future getPost({int id = -1}) async {
    Jmap param = {};
    if (id != -1) {
      param["id"] = id;
    }
    final response = await postService.postList(param);
    if (response.isSuccess) {
      List rawData = response.data;
      if (rawData.isNotEmpty) {
        return rawData.map((e) => PostModel.fromJson(e)).toList();
      }
    }
    return -1;
  }

  @override
  Future getPostComment({int id = -1}) async {
    Jmap param = {};
    if (id != -1) {
      param["postId"] = id;
    }
    final response = await postService.commentListByPost(param);

    if (response.isSuccess) {
      List rawData = response.data;
      if (rawData.isNotEmpty) {
        return rawData.map((e) => PostCommentModel.fromJson(e)).toList();
      }
    }
    return -1;
  }
}
