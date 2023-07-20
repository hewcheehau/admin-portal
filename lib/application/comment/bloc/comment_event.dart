part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}


class CommentListFetched extends CommentEvent {
  final int id;
  const CommentListFetched({this.id = -1});
  
  @override
  List<Object> get props => [id];
}