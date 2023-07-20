part of 'post_bloc.dart';

enum PostStatus { loading, success, fail, empty, init }

class PostState extends Equatable {
  final PostStatus status;
  final List<PostModel> postList;

  const PostState({this.status = PostStatus.init, this.postList = const []});

  PostState copyWith({
    PostStatus? status,
    List<PostModel>? postList,
  }) {
    return PostState(
        status: status ?? this.status, postList: postList ?? this.postList);
  }

  @override
  List<Object?> get props => [status, postList];
}
