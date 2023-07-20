part of 'comment_bloc.dart';

enum CommentStatus { loading, success, fail, empty, init }

class CommentState extends Equatable {
  final CommentStatus status;
  final List<PostCommentModel> comments;

  const CommentState({this.status = CommentStatus.init, this.comments = const []});

  CommentState copyWith({
    CommentStatus? status,
    List<PostCommentModel>? comments,
  }) {
    return CommentState(
        status: status ?? this.status, comments: comments ?? this.comments);
  }

  @override
  List<Object?> get props => [status, comments];
}
